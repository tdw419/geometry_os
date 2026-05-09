; DESCRIPTION: Renders a orange line between points (468, 73) and (120, 61).
; PLAN: r0=468(x1), r1=73(y1), r2=120(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 73
LDI r2, 120
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
