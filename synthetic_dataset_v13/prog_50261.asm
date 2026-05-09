; DESCRIPTION: Renders a purple line between points (292, 155) and (107, 215).
; PLAN: r0=292(x1), r1=155(y1), r2=107(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 155
LDI r2, 107
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
