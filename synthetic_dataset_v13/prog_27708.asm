; DESCRIPTION: Draws a orange line from (116, 89) to (210, 93).
; PLAN: r0=116(x1), r1=89(y1), r2=210(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 89
LDI r2, 210
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
