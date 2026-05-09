; DESCRIPTION: Renders a orange line between points (294, 155) and (76, 133).
; PLAN: r0=294(x1), r1=155(y1), r2=76(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 155
LDI r2, 76
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
