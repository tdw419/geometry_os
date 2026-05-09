; DESCRIPTION: Renders a orange line between points (384, 61) and (425, 212).
; PLAN: r0=384(x1), r1=61(y1), r2=425(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 61
LDI r2, 425
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
