; DESCRIPTION: Renders a red line between points (357, 23) and (92, 114).
; PLAN: r0=357(x1), r1=23(y1), r2=92(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 23
LDI r2, 92
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
