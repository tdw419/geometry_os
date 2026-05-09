; DESCRIPTION: Renders a red line between points (13, 86) and (373, 61).
; PLAN: r0=13(x1), r1=86(y1), r2=373(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 86
LDI r2, 373
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
