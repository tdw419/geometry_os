; DESCRIPTION: Renders a yellow line between points (421, 92) and (454, 14).
; PLAN: r0=421(x1), r1=92(y1), r2=454(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 92
LDI r2, 454
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
