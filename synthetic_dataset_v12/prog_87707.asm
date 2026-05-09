; DESCRIPTION: Renders a red line between points (370, 218) and (491, 61).
; PLAN: r0=370(x1), r1=218(y1), r2=491(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 218
LDI r2, 491
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
