; DESCRIPTION: Renders a orange line between points (332, 47) and (354, 112).
; PLAN: r0=332(x1), r1=47(y1), r2=354(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 47
LDI r2, 354
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
