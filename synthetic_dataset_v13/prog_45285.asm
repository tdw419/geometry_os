; DESCRIPTION: Draws a magenta line from (253, 252) to (232, 197).
; PLAN: r0=253(x1), r1=252(y1), r2=232(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 252
LDI r2, 232
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
