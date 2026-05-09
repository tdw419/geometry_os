; DESCRIPTION: Renders a green line between points (16, 232) and (92, 191).
; PLAN: r0=16(x1), r1=232(y1), r2=92(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 232
LDI r2, 92
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
