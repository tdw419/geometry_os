; DESCRIPTION: Renders a orange line between points (368, 13) and (297, 251).
; PLAN: r0=368(x1), r1=13(y1), r2=297(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 13
LDI r2, 297
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
