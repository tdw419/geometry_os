; DESCRIPTION: Renders a orange line between points (196, 165) and (133, 14).
; PLAN: r0=196(x1), r1=165(y1), r2=133(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 165
LDI r2, 133
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
