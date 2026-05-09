; DESCRIPTION: Renders a purple line between points (153, 140) and (326, 207).
; PLAN: r0=153(x1), r1=140(y1), r2=326(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 140
LDI r2, 326
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
