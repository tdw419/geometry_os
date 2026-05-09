; DESCRIPTION: Renders a blue line between points (101, 103) and (287, 94).
; PLAN: r0=101(x1), r1=103(y1), r2=287(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 103
LDI r2, 287
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
