; DESCRIPTION: Renders a yellow line between points (415, 16) and (92, 216).
; PLAN: r0=415(x1), r1=16(y1), r2=92(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 16
LDI r2, 92
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
