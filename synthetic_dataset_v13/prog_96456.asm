; DESCRIPTION: Renders a white line between points (43, 77) and (53, 5).
; PLAN: r0=43(x1), r1=77(y1), r2=53(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 77
LDI r2, 53
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
