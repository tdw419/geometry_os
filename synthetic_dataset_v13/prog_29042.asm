; DESCRIPTION: Draws a blue line from (0, 96) to (345, 95).
; PLAN: r0=0(x1), r1=96(y1), r2=345(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 96
LDI r2, 345
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
