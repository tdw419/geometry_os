; DESCRIPTION: Renders a white line between points (415, 123) and (343, 206).
; PLAN: r0=415(x1), r1=123(y1), r2=343(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 123
LDI r2, 343
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
