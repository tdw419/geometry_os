; DESCRIPTION: Draws a blue line from (55, 32) to (217, 88).
; PLAN: r0=55(x1), r1=32(y1), r2=217(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 32
LDI r2, 217
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
