; DESCRIPTION: Renders a purple line between points (71, 208) and (35, 161).
; PLAN: r0=71(x1), r1=208(y1), r2=35(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 208
LDI r2, 35
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
