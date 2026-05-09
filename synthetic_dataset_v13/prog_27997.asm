; DESCRIPTION: Renders a orange line between points (27, 31) and (165, 251).
; PLAN: r0=27(x1), r1=31(y1), r2=165(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 31
LDI r2, 165
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
