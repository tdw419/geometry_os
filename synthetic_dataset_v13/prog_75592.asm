; DESCRIPTION: Composite: Renders a white box of size 76x105 starting at (13, 16) then Places a magenta line segment connecting (11, 51) to (6, 81) then Sets a single orange pixel at (65, 184).
; PLAN: r0=13(x), r1=16(y), r2=76(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=51(y1), r7=6(x2), r8=81(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=184(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 13
LDI r1, 16
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 51
LDI r7, 6
LDI r8, 81
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 184
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
