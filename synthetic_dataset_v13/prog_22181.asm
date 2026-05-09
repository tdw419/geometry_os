; DESCRIPTION: Renders a orange line between points (12, 214) and (104, 126).
; PLAN: r0=12(x1), r1=214(y1), r2=104(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 214
LDI r2, 104
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
