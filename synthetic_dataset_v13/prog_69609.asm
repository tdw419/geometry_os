; DESCRIPTION: Renders a yellow line between points (210, 246) and (92, 79).
; PLAN: r0=210(x1), r1=246(y1), r2=92(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 246
LDI r2, 92
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
