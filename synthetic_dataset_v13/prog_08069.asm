; DESCRIPTION: Renders a orange line between points (208, 137) and (391, 204).
; PLAN: r0=208(x1), r1=137(y1), r2=391(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 137
LDI r2, 391
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
