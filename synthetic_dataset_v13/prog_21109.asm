; DESCRIPTION: Draws a orange line from (240, 240) to (310, 179).
; PLAN: r0=240(x1), r1=240(y1), r2=310(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 240
LDI r2, 310
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
