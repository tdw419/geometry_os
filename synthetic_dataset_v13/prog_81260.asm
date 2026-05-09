; DESCRIPTION: Renders a blue line between points (393, 86) and (92, 112).
; PLAN: r0=393(x1), r1=86(y1), r2=92(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 86
LDI r2, 92
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
