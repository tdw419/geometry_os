; DESCRIPTION: Draws a blue line from (50, 121) to (399, 17).
; PLAN: r0=50(x1), r1=121(y1), r2=399(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 121
LDI r2, 399
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
