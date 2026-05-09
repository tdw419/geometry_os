; DESCRIPTION: Places a blue line segment connecting (403, 161) to (51, 172).
; PLAN: r0=403(x1), r1=161(y1), r2=51(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 161
LDI r2, 51
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
