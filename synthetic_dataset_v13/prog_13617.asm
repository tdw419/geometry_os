; DESCRIPTION: Renders a black line between points (248, 188) and (282, 154).
; PLAN: r0=248(x1), r1=188(y1), r2=282(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 188
LDI r2, 282
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
