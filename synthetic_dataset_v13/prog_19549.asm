; DESCRIPTION: Renders a purple line between points (372, 98) and (326, 3).
; PLAN: r0=372(x1), r1=98(y1), r2=326(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 98
LDI r2, 326
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
