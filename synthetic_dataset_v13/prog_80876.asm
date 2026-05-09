; DESCRIPTION: Renders a orange line between points (13, 67) and (102, 204).
; PLAN: r0=13(x1), r1=67(y1), r2=102(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 67
LDI r2, 102
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
