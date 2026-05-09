; DESCRIPTION: Renders a yellow line between points (92, 181) and (188, 50).
; PLAN: r0=92(x1), r1=181(y1), r2=188(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 181
LDI r2, 188
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
