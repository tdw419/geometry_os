; DESCRIPTION: Renders a yellow line between points (317, 92) and (230, 129).
; PLAN: r0=317(x1), r1=92(y1), r2=230(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 92
LDI r2, 230
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
