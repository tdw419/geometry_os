; DESCRIPTION: Draws a orange line from (499, 173) to (419, 71).
; PLAN: r0=499(x1), r1=173(y1), r2=419(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 173
LDI r2, 419
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
