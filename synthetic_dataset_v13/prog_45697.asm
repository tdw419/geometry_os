; DESCRIPTION: Renders a white line between points (285, 166) and (343, 121).
; PLAN: r0=285(x1), r1=166(y1), r2=343(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 166
LDI r2, 343
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
