; DESCRIPTION: Renders a orange line between points (308, 253) and (104, 89).
; PLAN: r0=308(x1), r1=253(y1), r2=104(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 253
LDI r2, 104
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
