; DESCRIPTION: Renders a orange line between points (18, 142) and (126, 141).
; PLAN: r0=18(x1), r1=142(y1), r2=126(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 142
LDI r2, 126
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
