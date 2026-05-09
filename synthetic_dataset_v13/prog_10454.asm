; DESCRIPTION: Draws a blue line from (306, 72) to (223, 255).
; PLAN: r0=306(x1), r1=72(y1), r2=223(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 72
LDI r2, 223
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
