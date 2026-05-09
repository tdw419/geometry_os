; DESCRIPTION: Draws a blue line from (476, 125) to (50, 200).
; PLAN: r0=476(x1), r1=125(y1), r2=50(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 125
LDI r2, 50
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
