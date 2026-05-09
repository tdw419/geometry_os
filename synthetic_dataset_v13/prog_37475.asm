; DESCRIPTION: Draws a blue line from (360, 136) to (328, 115).
; PLAN: r0=360(x1), r1=136(y1), r2=328(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 136
LDI r2, 328
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
