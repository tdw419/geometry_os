; DESCRIPTION: Renders a orange line between points (54, 5) and (445, 12).
; PLAN: r0=54(x1), r1=5(y1), r2=445(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 5
LDI r2, 445
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
