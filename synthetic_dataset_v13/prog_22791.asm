; DESCRIPTION: Draws a blue line from (454, 127) to (86, 226).
; PLAN: r0=454(x1), r1=127(y1), r2=86(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 127
LDI r2, 86
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
