; DESCRIPTION: Draws a orange line from (13, 150) to (391, 255).
; PLAN: r0=13(x1), r1=150(y1), r2=391(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 150
LDI r2, 391
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
