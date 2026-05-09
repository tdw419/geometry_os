; DESCRIPTION: Places a blue line segment connecting (418, 14) to (401, 25).
; PLAN: r0=418(x1), r1=14(y1), r2=401(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 14
LDI r2, 401
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
