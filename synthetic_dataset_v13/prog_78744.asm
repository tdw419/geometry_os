; DESCRIPTION: Renders a purple line between points (117, 226) and (266, 186).
; PLAN: r0=117(x1), r1=226(y1), r2=266(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 226
LDI r2, 266
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
