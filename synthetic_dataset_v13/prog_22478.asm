; DESCRIPTION: Renders a white line between points (505, 169) and (27, 53).
; PLAN: r0=505(x1), r1=169(y1), r2=27(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 169
LDI r2, 27
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
