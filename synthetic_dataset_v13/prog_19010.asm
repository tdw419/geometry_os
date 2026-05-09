; DESCRIPTION: Renders a orange line between points (209, 121) and (276, 112).
; PLAN: r0=209(x1), r1=121(y1), r2=276(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 121
LDI r2, 276
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
