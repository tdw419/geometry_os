; DESCRIPTION: Renders a orange line between points (430, 189) and (178, 27).
; PLAN: r0=430(x1), r1=189(y1), r2=178(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 189
LDI r2, 178
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
