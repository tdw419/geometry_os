; DESCRIPTION: Places a purple line segment connecting (327, 238) to (192, 210).
; PLAN: r0=327(x1), r1=238(y1), r2=192(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 238
LDI r2, 192
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
