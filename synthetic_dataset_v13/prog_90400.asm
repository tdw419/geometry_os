; DESCRIPTION: Draws a orange line from (269, 240) to (53, 77).
; PLAN: r0=269(x1), r1=240(y1), r2=53(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 240
LDI r2, 53
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
