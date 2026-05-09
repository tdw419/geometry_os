; DESCRIPTION: Renders a orange line between points (21, 117) and (87, 241).
; PLAN: r0=21(x1), r1=117(y1), r2=87(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 117
LDI r2, 87
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
