; DESCRIPTION: Renders a orange line between points (117, 83) and (30, 45).
; PLAN: r0=117(x1), r1=83(y1), r2=30(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 83
LDI r2, 30
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
