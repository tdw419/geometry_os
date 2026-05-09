; DESCRIPTION: Draws a orange line from (170, 6) to (368, 71).
; PLAN: r0=170(x1), r1=6(y1), r2=368(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 6
LDI r2, 368
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
