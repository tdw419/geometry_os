; DESCRIPTION: Renders a orange line between points (21, 61) and (433, 202).
; PLAN: r0=21(x1), r1=61(y1), r2=433(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 61
LDI r2, 433
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
