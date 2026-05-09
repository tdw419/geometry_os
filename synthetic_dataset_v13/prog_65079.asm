; DESCRIPTION: Draws a blue line from (72, 226) to (4, 5).
; PLAN: r0=72(x1), r1=226(y1), r2=4(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 226
LDI r2, 4
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
