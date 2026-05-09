; DESCRIPTION: Renders a orange line between points (230, 232) and (86, 92).
; PLAN: r0=230(x1), r1=232(y1), r2=86(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 232
LDI r2, 86
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
