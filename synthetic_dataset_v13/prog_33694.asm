; DESCRIPTION: Draws a blue line from (82, 150) to (476, 244).
; PLAN: r0=82(x1), r1=150(y1), r2=476(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 150
LDI r2, 476
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
