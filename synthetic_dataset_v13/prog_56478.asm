; DESCRIPTION: Draws a blue line from (359, 15) to (408, 132).
; PLAN: r0=359(x1), r1=15(y1), r2=408(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 15
LDI r2, 408
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
