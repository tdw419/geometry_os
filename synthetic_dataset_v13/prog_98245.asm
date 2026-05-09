; DESCRIPTION: Draws a orange line from (458, 159) to (300, 174).
; PLAN: r0=458(x1), r1=159(y1), r2=300(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 159
LDI r2, 300
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
