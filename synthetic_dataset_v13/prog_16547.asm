; DESCRIPTION: Renders a orange line between points (167, 197) and (389, 218).
; PLAN: r0=167(x1), r1=197(y1), r2=389(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 197
LDI r2, 389
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
