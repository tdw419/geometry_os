; DESCRIPTION: Draws a yellow line from (133, 176) to (186, 186).
; PLAN: r0=133(x1), r1=176(y1), r2=186(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 176
LDI r2, 186
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
