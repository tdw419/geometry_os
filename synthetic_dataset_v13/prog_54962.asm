; DESCRIPTION: Renders a orange line between points (290, 31) and (328, 254).
; PLAN: r0=290(x1), r1=31(y1), r2=328(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 31
LDI r2, 328
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
