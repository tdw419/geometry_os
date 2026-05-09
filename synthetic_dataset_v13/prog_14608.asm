; DESCRIPTION: Places a purple line segment connecting (76, 243) to (417, 38).
; PLAN: r0=76(x1), r1=243(y1), r2=417(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 243
LDI r2, 417
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
