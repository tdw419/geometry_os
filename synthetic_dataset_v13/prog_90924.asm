; DESCRIPTION: Renders a purple line between points (44, 161) and (220, 207).
; PLAN: r0=44(x1), r1=161(y1), r2=220(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 161
LDI r2, 220
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
