; DESCRIPTION: Renders a purple line between points (188, 53) and (21, 207).
; PLAN: r0=188(x1), r1=53(y1), r2=21(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 53
LDI r2, 21
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
