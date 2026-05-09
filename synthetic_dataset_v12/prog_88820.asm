; DESCRIPTION: Renders a orange line between points (91, 1) and (445, 118).
; PLAN: r0=91(x1), r1=1(y1), r2=445(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 1
LDI r2, 445
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
