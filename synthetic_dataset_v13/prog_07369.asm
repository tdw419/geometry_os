; DESCRIPTION: Renders a white line between points (369, 226) and (1, 53).
; PLAN: r0=369(x1), r1=226(y1), r2=1(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 226
LDI r2, 1
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
