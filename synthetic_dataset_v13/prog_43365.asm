; DESCRIPTION: Renders a purple line between points (71, 68) and (186, 207).
; PLAN: r0=71(x1), r1=68(y1), r2=186(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 68
LDI r2, 186
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
