; DESCRIPTION: Places a blue line segment connecting (375, 125) to (17, 114).
; PLAN: r0=375(x1), r1=125(y1), r2=17(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 125
LDI r2, 17
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
