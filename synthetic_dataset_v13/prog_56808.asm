; DESCRIPTION: Draws a blue line from (76, 164) to (506, 207).
; PLAN: r0=76(x1), r1=164(y1), r2=506(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 164
LDI r2, 506
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
