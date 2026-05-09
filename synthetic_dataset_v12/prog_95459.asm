; DESCRIPTION: Draws a blue line from (101, 39) to (21, 137).
; PLAN: r0=101(x1), r1=39(y1), r2=21(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 39
LDI r2, 21
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
