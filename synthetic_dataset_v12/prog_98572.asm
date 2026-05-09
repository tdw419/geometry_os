; DESCRIPTION: Renders a white line between points (499, 92) and (504, 136).
; PLAN: r0=499(x1), r1=92(y1), r2=504(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 92
LDI r2, 504
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
