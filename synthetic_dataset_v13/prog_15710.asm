; DESCRIPTION: Renders a purple line between points (297, 10) and (326, 14).
; PLAN: r0=297(x1), r1=10(y1), r2=326(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 10
LDI r2, 326
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
