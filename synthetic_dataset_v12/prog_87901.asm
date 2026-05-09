; DESCRIPTION: Renders a orange line between points (67, 65) and (204, 131).
; PLAN: r0=67(x1), r1=65(y1), r2=204(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 65
LDI r2, 204
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
