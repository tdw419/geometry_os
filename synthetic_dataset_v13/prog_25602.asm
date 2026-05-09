; DESCRIPTION: Renders a orange line between points (503, 3) and (206, 12).
; PLAN: r0=503(x1), r1=3(y1), r2=206(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 3
LDI r2, 206
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
