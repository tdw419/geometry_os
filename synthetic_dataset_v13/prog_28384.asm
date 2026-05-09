; DESCRIPTION: Renders a purple line between points (66, 94) and (292, 193).
; PLAN: r0=66(x1), r1=94(y1), r2=292(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 94
LDI r2, 292
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
