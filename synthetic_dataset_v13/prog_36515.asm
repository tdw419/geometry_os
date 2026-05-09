; DESCRIPTION: Draws a purple line from (186, 243) to (244, 53).
; PLAN: r0=186(x1), r1=243(y1), r2=244(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 243
LDI r2, 244
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
