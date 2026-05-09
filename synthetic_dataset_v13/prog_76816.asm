; DESCRIPTION: Renders a orange line between points (239, 74) and (232, 109).
; PLAN: r0=239(x1), r1=74(y1), r2=232(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 74
LDI r2, 232
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
