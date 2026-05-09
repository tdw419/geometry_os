; DESCRIPTION: Renders a orange line between points (380, 83) and (81, 214).
; PLAN: r0=380(x1), r1=83(y1), r2=81(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 83
LDI r2, 81
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
