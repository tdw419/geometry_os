; DESCRIPTION: Renders a orange line between points (245, 178) and (487, 74).
; PLAN: r0=245(x1), r1=178(y1), r2=487(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 178
LDI r2, 487
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
