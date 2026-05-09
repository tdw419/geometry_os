; DESCRIPTION: Draws a blue line from (396, 46) to (360, 144).
; PLAN: r0=396(x1), r1=46(y1), r2=360(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 46
LDI r2, 360
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
