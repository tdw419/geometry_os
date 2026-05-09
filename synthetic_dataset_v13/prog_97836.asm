; DESCRIPTION: Renders a red line between points (92, 67) and (407, 73).
; PLAN: r0=92(x1), r1=67(y1), r2=407(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 67
LDI r2, 407
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
