; DESCRIPTION: Renders a orange line between points (6, 64) and (137, 193).
; PLAN: r0=6(x1), r1=64(y1), r2=137(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 64
LDI r2, 137
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
