; DESCRIPTION: Draws a blue line from (101, 166) to (121, 53).
; PLAN: r0=101(x1), r1=166(y1), r2=121(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 166
LDI r2, 121
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
