; DESCRIPTION: Renders a white line between points (148, 38) and (72, 100).
; PLAN: r0=148(x1), r1=38(y1), r2=72(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 38
LDI r2, 72
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
