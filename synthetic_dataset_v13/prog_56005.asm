; DESCRIPTION: Renders a orange line between points (144, 113) and (141, 108).
; PLAN: r0=144(x1), r1=113(y1), r2=141(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 113
LDI r2, 141
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
