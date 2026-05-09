; DESCRIPTION: Renders a white line between points (253, 121) and (5, 58).
; PLAN: r0=253(x1), r1=121(y1), r2=5(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 121
LDI r2, 5
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
