; DESCRIPTION: Renders a orange line between points (162, 254) and (103, 93).
; PLAN: r0=162(x1), r1=254(y1), r2=103(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 254
LDI r2, 103
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
