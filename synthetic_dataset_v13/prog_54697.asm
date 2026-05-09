; DESCRIPTION: Composite: Places a red circle of radius 77 at center (414, 110) then Renders a cyan box of size 102x94 starting at (235, 118) then Sets a single cyan pixel at (391, 223).
; PLAN: r0=414(x), r1=110(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=118(y), r7=102(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=223(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 110
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 118
LDI r7, 102
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 223
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
