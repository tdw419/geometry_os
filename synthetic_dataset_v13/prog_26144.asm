; DESCRIPTION: Renders a orange line between points (104, 204) and (143, 208).
; PLAN: r0=104(x1), r1=204(y1), r2=143(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 204
LDI r2, 143
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
