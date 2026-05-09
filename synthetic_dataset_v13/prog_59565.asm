; DESCRIPTION: Renders a white line between points (399, 153) and (159, 73).
; PLAN: r0=399(x1), r1=153(y1), r2=159(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 153
LDI r2, 159
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
