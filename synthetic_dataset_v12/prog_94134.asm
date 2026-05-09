; DESCRIPTION: Renders a orange line between points (260, 201) and (246, 166).
; PLAN: r0=260(x1), r1=201(y1), r2=246(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 201
LDI r2, 246
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
