; DESCRIPTION: Renders a orange line between points (323, 135) and (394, 32).
; PLAN: r0=323(x1), r1=135(y1), r2=394(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 135
LDI r2, 394
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
