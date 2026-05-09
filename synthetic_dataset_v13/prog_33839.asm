; DESCRIPTION: Composite: Places a green line segment connecting (60, 51) to (205, 9) then Draws a white circle centered at (216, 102) with radius 79.
; PLAN: r0=60(x1), r1=51(y1), r2=205(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=102(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 51
LDI r2, 205
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 102
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
