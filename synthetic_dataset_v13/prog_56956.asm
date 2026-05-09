; DESCRIPTION: Renders a yellow line between points (219, 184) and (393, 92).
; PLAN: r0=219(x1), r1=184(y1), r2=393(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 184
LDI r2, 393
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
