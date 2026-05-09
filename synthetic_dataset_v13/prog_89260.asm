; DESCRIPTION: Draws a magenta line from (232, 137) to (213, 35).
; PLAN: r0=232(x1), r1=137(y1), r2=213(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 137
LDI r2, 213
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
