; DESCRIPTION: Composite: Places a white dot at position (154, 3) then Creates a blue rectangular region at (235, 229) spanning 99 by 25 pixels.
; PLAN: r0=154(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=229(y), r7=99(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 229
LDI r7, 99
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
