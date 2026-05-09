; DESCRIPTION: Renders a orange line between points (38, 29) and (168, 232).
; PLAN: r0=38(x1), r1=29(y1), r2=168(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 29
LDI r2, 168
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
