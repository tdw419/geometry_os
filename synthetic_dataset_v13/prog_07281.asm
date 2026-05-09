; DESCRIPTION: Draws a orange line from (136, 100) to (226, 64).
; PLAN: r0=136(x1), r1=100(y1), r2=226(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 100
LDI r2, 226
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
