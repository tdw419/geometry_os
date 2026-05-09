; DESCRIPTION: Draws a yellow line from (433, 165) to (355, 155).
; PLAN: r0=433(x1), r1=165(y1), r2=355(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 165
LDI r2, 355
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
