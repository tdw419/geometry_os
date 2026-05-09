; DESCRIPTION: Renders a orange line between points (12, 95) and (91, 30).
; PLAN: r0=12(x1), r1=95(y1), r2=91(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 95
LDI r2, 91
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
