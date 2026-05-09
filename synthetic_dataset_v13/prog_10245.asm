; DESCRIPTION: Renders a orange line between points (183, 104) and (231, 60).
; PLAN: r0=183(x1), r1=104(y1), r2=231(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 104
LDI r2, 231
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
