; DESCRIPTION: Renders a yellow line between points (193, 241) and (92, 194).
; PLAN: r0=193(x1), r1=241(y1), r2=92(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 241
LDI r2, 92
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
