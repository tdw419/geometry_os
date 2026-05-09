; DESCRIPTION: Composite: Sets a single orange pixel at (325, 5) then Renders a green box of size 77x26 starting at (366, 184) then Draws a white line from (140, 52) to (123, 199).
; PLAN: r0=325(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=184(y), r7=77(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x1), r11=52(y1), r12=123(x2), r13=199(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 5
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 366
LDI r6, 184
LDI r7, 77
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 52
LDI r12, 123
LDI r13, 199
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
