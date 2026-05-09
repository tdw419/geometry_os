; DESCRIPTION: Places a purple line segment connecting (38, 14) to (237, 210).
; PLAN: r0=38(x1), r1=14(y1), r2=237(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 14
LDI r2, 237
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
