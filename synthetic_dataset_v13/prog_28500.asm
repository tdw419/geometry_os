; DESCRIPTION: Renders a yellow line between points (40, 174) and (92, 23).
; PLAN: r0=40(x1), r1=174(y1), r2=92(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 174
LDI r2, 92
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
