; DESCRIPTION: Places a blue line segment connecting (492, 238) to (146, 201).
; PLAN: r0=492(x1), r1=238(y1), r2=146(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 238
LDI r2, 146
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
