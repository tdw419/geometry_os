; DESCRIPTION: Draws a blue line from (416, 47) to (159, 28).
; PLAN: r0=416(x1), r1=47(y1), r2=159(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 47
LDI r2, 159
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
