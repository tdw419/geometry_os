; DESCRIPTION: Renders a orange line between points (387, 43) and (176, 199).
; PLAN: r0=387(x1), r1=43(y1), r2=176(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 43
LDI r2, 176
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
