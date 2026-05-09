; DESCRIPTION: Renders a orange line between points (473, 200) and (228, 212).
; PLAN: r0=473(x1), r1=200(y1), r2=228(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 200
LDI r2, 228
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
