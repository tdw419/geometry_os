; DESCRIPTION: Renders a orange line between points (299, 214) and (251, 86).
; PLAN: r0=299(x1), r1=214(y1), r2=251(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 214
LDI r2, 251
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
