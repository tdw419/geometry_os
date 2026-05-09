; DESCRIPTION: Renders a orange line between points (28, 53) and (425, 233).
; PLAN: r0=28(x1), r1=53(y1), r2=425(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 53
LDI r2, 425
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
