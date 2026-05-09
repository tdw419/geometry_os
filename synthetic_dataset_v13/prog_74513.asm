; DESCRIPTION: Draws a orange line from (20, 111) to (454, 21).
; PLAN: r0=20(x1), r1=111(y1), r2=454(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 111
LDI r2, 454
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
