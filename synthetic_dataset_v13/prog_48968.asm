; DESCRIPTION: Renders a black line between points (92, 229) and (169, 184).
; PLAN: r0=92(x1), r1=229(y1), r2=169(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 229
LDI r2, 169
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
