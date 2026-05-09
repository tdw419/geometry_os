; DESCRIPTION: Renders a white line between points (347, 26) and (399, 115).
; PLAN: r0=347(x1), r1=26(y1), r2=399(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 26
LDI r2, 399
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
