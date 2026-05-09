; DESCRIPTION: Draws a blue line from (117, 52) to (33, 189).
; PLAN: r0=117(x1), r1=52(y1), r2=33(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 52
LDI r2, 33
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
