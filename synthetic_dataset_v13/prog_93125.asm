; DESCRIPTION: Places a blue line segment connecting (293, 148) to (164, 26).
; PLAN: r0=293(x1), r1=148(y1), r2=164(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 148
LDI r2, 164
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
