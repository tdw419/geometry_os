; DESCRIPTION: Renders a orange line between points (160, 91) and (50, 68).
; PLAN: r0=160(x1), r1=91(y1), r2=50(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 91
LDI r2, 50
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
