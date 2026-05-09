; DESCRIPTION: Renders a green line between points (335, 136) and (1, 16).
; PLAN: r0=335(x1), r1=136(y1), r2=1(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 136
LDI r2, 1
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
