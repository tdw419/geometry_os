; DESCRIPTION: Draws a blue line from (499, 181) to (233, 86).
; PLAN: r0=499(x1), r1=181(y1), r2=233(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 181
LDI r2, 233
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
