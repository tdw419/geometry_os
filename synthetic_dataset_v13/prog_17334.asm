; DESCRIPTION: Draws a blue line from (132, 121) to (76, 154).
; PLAN: r0=132(x1), r1=121(y1), r2=76(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 121
LDI r2, 76
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
