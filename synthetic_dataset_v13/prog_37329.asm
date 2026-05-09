; DESCRIPTION: Draws a blue line from (2, 6) to (72, 6).
; PLAN: r0=2(x1), r1=6(y1), r2=72(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 6
LDI r2, 72
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
