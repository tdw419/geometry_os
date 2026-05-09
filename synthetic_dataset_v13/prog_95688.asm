; DESCRIPTION: Draws a blue line from (29, 208) to (232, 21).
; PLAN: r0=29(x1), r1=208(y1), r2=232(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 208
LDI r2, 232
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
