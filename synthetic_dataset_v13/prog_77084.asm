; DESCRIPTION: Renders a green line between points (137, 96) and (77, 72).
; PLAN: r0=137(x1), r1=96(y1), r2=77(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 96
LDI r2, 77
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
