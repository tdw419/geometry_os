; DESCRIPTION: Draws a white line from (55, 112) to (496, 120).
; PLAN: r0=55(x1), r1=112(y1), r2=496(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 112
LDI r2, 496
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
