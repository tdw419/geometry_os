; DESCRIPTION: Draws a blue line from (232, 144) to (210, 251).
; PLAN: r0=232(x1), r1=144(y1), r2=210(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 144
LDI r2, 210
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
