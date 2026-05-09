; DESCRIPTION: Renders a orange line between points (56, 195) and (452, 37).
; PLAN: r0=56(x1), r1=195(y1), r2=452(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 195
LDI r2, 452
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
