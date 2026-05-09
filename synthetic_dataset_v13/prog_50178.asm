; DESCRIPTION: Renders a orange line between points (445, 145) and (25, 75).
; PLAN: r0=445(x1), r1=145(y1), r2=25(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 145
LDI r2, 25
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
