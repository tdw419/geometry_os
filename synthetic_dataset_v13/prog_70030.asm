; DESCRIPTION: Renders a purple line between points (98, 33) and (287, 176).
; PLAN: r0=98(x1), r1=33(y1), r2=287(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 33
LDI r2, 287
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
