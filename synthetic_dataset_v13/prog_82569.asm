; DESCRIPTION: Places a white line segment connecting (13, 198) to (375, 159).
; PLAN: r0=13(x1), r1=198(y1), r2=375(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 198
LDI r2, 375
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
