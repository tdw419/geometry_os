; DESCRIPTION: Draws a orange line from (449, 24) to (283, 39).
; PLAN: r0=449(x1), r1=24(y1), r2=283(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 24
LDI r2, 283
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
