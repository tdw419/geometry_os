; DESCRIPTION: Renders a orange line between points (12, 251) and (207, 144).
; PLAN: r0=12(x1), r1=251(y1), r2=207(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 251
LDI r2, 207
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
