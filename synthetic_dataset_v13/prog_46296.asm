; DESCRIPTION: Renders a orange line between points (382, 217) and (377, 16).
; PLAN: r0=382(x1), r1=217(y1), r2=377(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 217
LDI r2, 377
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
