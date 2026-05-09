; DESCRIPTION: Renders a orange line between points (396, 67) and (219, 96).
; PLAN: r0=396(x1), r1=67(y1), r2=219(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 67
LDI r2, 219
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
