; DESCRIPTION: Renders a white line between points (54, 53) and (434, 88).
; PLAN: r0=54(x1), r1=53(y1), r2=434(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 53
LDI r2, 434
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
