; DESCRIPTION: Renders a magenta line between points (501, 24) and (104, 59).
; PLAN: r0=501(x1), r1=24(y1), r2=104(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 24
LDI r2, 104
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
