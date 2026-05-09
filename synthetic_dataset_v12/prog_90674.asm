; DESCRIPTION: Draws a black line from (429, 234) to (473, 203).
; PLAN: r0=429(x1), r1=234(y1), r2=473(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 234
LDI r2, 473
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
