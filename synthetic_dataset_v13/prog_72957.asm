; DESCRIPTION: Renders a orange line between points (294, 158) and (57, 233).
; PLAN: r0=294(x1), r1=158(y1), r2=57(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 158
LDI r2, 57
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
