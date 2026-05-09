; DESCRIPTION: Renders a orange line between points (60, 223) and (10, 93).
; PLAN: r0=60(x1), r1=223(y1), r2=10(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 223
LDI r2, 10
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
