; DESCRIPTION: Draws a red line from (318, 161) to (93, 86).
; PLAN: r0=318(x1), r1=161(y1), r2=93(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 161
LDI r2, 93
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
