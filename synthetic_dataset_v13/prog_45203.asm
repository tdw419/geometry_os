; DESCRIPTION: Draws a yellow line from (24, 226) to (388, 110).
; PLAN: r0=24(x1), r1=226(y1), r2=388(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 226
LDI r2, 388
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
