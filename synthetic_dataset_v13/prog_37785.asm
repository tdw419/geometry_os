; DESCRIPTION: Renders a magenta line between points (38, 14) and (92, 197).
; PLAN: r0=38(x1), r1=14(y1), r2=92(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 14
LDI r2, 92
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
