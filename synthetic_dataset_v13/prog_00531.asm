; DESCRIPTION: Renders a orange line between points (248, 193) and (332, 241).
; PLAN: r0=248(x1), r1=193(y1), r2=332(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 193
LDI r2, 332
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
