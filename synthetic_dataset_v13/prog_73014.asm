; DESCRIPTION: Renders a orange line between points (117, 166) and (101, 5).
; PLAN: r0=117(x1), r1=166(y1), r2=101(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 166
LDI r2, 101
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
