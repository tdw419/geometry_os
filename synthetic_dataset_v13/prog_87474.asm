; DESCRIPTION: Renders a orange line between points (231, 134) and (449, 45).
; PLAN: r0=231(x1), r1=134(y1), r2=449(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 134
LDI r2, 449
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
