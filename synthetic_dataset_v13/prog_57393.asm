; DESCRIPTION: Renders a purple line between points (326, 210) and (96, 216).
; PLAN: r0=326(x1), r1=210(y1), r2=96(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 210
LDI r2, 96
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
