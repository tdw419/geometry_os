; DESCRIPTION: Draws a orange line from (377, 255) to (124, 90).
; PLAN: r0=377(x1), r1=255(y1), r2=124(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 255
LDI r2, 124
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
