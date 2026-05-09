; DESCRIPTION: Draws a blue line from (434, 110) to (286, 101).
; PLAN: r0=434(x1), r1=110(y1), r2=286(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 110
LDI r2, 286
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
