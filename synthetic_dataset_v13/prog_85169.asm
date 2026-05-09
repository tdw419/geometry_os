; DESCRIPTION: Renders a yellow line between points (313, 67) and (139, 78).
; PLAN: r0=313(x1), r1=67(y1), r2=139(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 67
LDI r2, 139
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
