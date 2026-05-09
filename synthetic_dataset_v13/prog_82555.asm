; DESCRIPTION: Draws a orange line from (499, 40) to (371, 246).
; PLAN: r0=499(x1), r1=40(y1), r2=371(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 40
LDI r2, 371
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
