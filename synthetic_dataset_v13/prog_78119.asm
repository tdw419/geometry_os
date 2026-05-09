; DESCRIPTION: Draws a blue line from (287, 103) to (386, 136).
; PLAN: r0=287(x1), r1=103(y1), r2=386(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 103
LDI r2, 386
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
