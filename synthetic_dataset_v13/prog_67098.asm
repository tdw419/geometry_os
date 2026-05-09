; DESCRIPTION: Draws a orange line from (90, 10) to (368, 89).
; PLAN: r0=90(x1), r1=10(y1), r2=368(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 10
LDI r2, 368
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
