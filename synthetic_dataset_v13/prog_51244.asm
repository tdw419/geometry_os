; DESCRIPTION: Draws a blue line from (70, 181) to (15, 209).
; PLAN: r0=70(x1), r1=181(y1), r2=15(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 181
LDI r2, 15
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
