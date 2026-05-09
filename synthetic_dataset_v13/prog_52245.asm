; DESCRIPTION: Draws a blue line from (236, 141) to (72, 120).
; PLAN: r0=236(x1), r1=141(y1), r2=72(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 141
LDI r2, 72
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
