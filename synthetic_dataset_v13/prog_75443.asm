; DESCRIPTION: Renders a orange line between points (484, 38) and (387, 199).
; PLAN: r0=484(x1), r1=38(y1), r2=387(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 38
LDI r2, 387
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
