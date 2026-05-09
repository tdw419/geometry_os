; DESCRIPTION: Draws a blue line from (200, 191) to (76, 172).
; PLAN: r0=200(x1), r1=191(y1), r2=76(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 191
LDI r2, 76
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
