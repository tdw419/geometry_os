; DESCRIPTION: Draws a blue line from (282, 36) to (360, 43).
; PLAN: r0=282(x1), r1=36(y1), r2=360(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 36
LDI r2, 360
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
