; DESCRIPTION: Draws a orange line from (2, 163) to (255, 188).
; PLAN: r0=2(x1), r1=163(y1), r2=255(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 163
LDI r2, 255
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
