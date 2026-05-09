; DESCRIPTION: Renders a white line between points (413, 88) and (53, 168).
; PLAN: r0=413(x1), r1=88(y1), r2=53(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 88
LDI r2, 53
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
