; DESCRIPTION: Draws a orange line from (341, 133) to (64, 90).
; PLAN: r0=341(x1), r1=133(y1), r2=64(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 133
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
