; DESCRIPTION: Places a blue line segment connecting (94, 38) to (195, 214).
; PLAN: r0=94(x1), r1=38(y1), r2=195(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 38
LDI r2, 195
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
