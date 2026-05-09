; DESCRIPTION: Draws a orange line from (435, 166) to (420, 90).
; PLAN: r0=435(x1), r1=166(y1), r2=420(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 166
LDI r2, 420
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
