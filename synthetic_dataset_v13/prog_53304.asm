; DESCRIPTION: Renders a orange line between points (403, 156) and (71, 188).
; PLAN: r0=403(x1), r1=156(y1), r2=71(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 156
LDI r2, 71
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
