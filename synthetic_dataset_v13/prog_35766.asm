; DESCRIPTION: Composite: Sets a single yellow pixel at (467, 107) then Renders a cyan box of size 11x37 starting at (329, 153) then Renders a green disk with center (285, 99) and radius 24.
; PLAN: r0=467(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=153(y), r7=11(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=99(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 153
LDI r7, 11
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 99
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
