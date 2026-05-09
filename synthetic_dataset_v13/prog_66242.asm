; DESCRIPTION: Renders a orange line between points (43, 90) and (389, 126).
; PLAN: r0=43(x1), r1=90(y1), r2=389(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 90
LDI r2, 389
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
