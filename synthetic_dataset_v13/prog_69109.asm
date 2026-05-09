; DESCRIPTION: Draws a orange line from (511, 116) to (412, 40).
; PLAN: r0=511(x1), r1=116(y1), r2=412(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 116
LDI r2, 412
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
