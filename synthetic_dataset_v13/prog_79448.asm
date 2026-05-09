; DESCRIPTION: Renders a orange line between points (265, 82) and (37, 26).
; PLAN: r0=265(x1), r1=82(y1), r2=37(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 82
LDI r2, 37
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
