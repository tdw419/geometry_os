; DESCRIPTION: Renders a orange line between points (503, 117) and (94, 60).
; PLAN: r0=503(x1), r1=117(y1), r2=94(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 117
LDI r2, 94
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
