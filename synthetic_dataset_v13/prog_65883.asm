; DESCRIPTION: Draws a orange line from (269, 10) to (260, 41).
; PLAN: r0=269(x1), r1=10(y1), r2=260(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 10
LDI r2, 260
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
