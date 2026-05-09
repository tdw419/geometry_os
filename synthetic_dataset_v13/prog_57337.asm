; DESCRIPTION: Renders a orange line between points (459, 236) and (93, 209).
; PLAN: r0=459(x1), r1=236(y1), r2=93(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 236
LDI r2, 93
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
