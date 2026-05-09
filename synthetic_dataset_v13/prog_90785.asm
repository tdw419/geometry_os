; DESCRIPTION: Renders a orange line between points (445, 172) and (118, 88).
; PLAN: r0=445(x1), r1=172(y1), r2=118(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 172
LDI r2, 118
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
