; DESCRIPTION: Renders a black line between points (116, 193) and (92, 113).
; PLAN: r0=116(x1), r1=193(y1), r2=92(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 193
LDI r2, 92
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
