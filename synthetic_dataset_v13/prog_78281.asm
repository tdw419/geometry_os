; DESCRIPTION: Renders a orange line between points (246, 19) and (25, 208).
; PLAN: r0=246(x1), r1=19(y1), r2=25(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 19
LDI r2, 25
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
