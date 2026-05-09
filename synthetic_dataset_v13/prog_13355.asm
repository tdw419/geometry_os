; DESCRIPTION: Renders a orange line between points (121, 206) and (405, 41).
; PLAN: r0=121(x1), r1=206(y1), r2=405(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 206
LDI r2, 405
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
