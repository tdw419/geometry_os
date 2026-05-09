; DESCRIPTION: Renders a black line between points (92, 8) and (276, 232).
; PLAN: r0=92(x1), r1=8(y1), r2=276(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 8
LDI r2, 276
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
