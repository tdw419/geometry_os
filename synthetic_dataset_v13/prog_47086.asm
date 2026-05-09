; DESCRIPTION: Draws a blue line from (59, 165) to (431, 203).
; PLAN: r0=59(x1), r1=165(y1), r2=431(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 165
LDI r2, 431
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
