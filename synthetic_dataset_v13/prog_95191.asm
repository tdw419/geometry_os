; DESCRIPTION: Renders a white line between points (312, 173) and (318, 88).
; PLAN: r0=312(x1), r1=173(y1), r2=318(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 173
LDI r2, 318
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
