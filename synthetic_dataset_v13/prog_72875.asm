; DESCRIPTION: Places a white line segment connecting (136, 253) to (262, 112).
; PLAN: r0=136(x1), r1=253(y1), r2=262(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 253
LDI r2, 262
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
