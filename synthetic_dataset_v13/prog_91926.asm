; DESCRIPTION: Draws a orange line from (116, 41) to (363, 143).
; PLAN: r0=116(x1), r1=41(y1), r2=363(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 41
LDI r2, 363
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
