; DESCRIPTION: Renders a orange line between points (414, 67) and (127, 230).
; PLAN: r0=414(x1), r1=67(y1), r2=127(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 67
LDI r2, 127
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
