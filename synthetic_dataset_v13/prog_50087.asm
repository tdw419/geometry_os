; DESCRIPTION: Draws a orange line from (469, 112) to (478, 143).
; PLAN: r0=469(x1), r1=112(y1), r2=478(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 112
LDI r2, 478
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
