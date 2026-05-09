; DESCRIPTION: Draws a blue line from (253, 121) to (5, 167).
; PLAN: r0=253(x1), r1=121(y1), r2=5(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 121
LDI r2, 5
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
