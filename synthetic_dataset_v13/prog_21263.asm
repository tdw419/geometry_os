; DESCRIPTION: Draws a blue line from (57, 86) to (132, 250).
; PLAN: r0=57(x1), r1=86(y1), r2=132(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 86
LDI r2, 132
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
