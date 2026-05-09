; DESCRIPTION: Draws a orange line from (174, 56) to (434, 36).
; PLAN: r0=174(x1), r1=56(y1), r2=434(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 56
LDI r2, 434
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
