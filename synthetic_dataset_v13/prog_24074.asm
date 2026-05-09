; DESCRIPTION: Renders a cyan line between points (163, 69) and (282, 147).
; PLAN: r0=163(x1), r1=69(y1), r2=282(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 69
LDI r2, 282
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
