; DESCRIPTION: Renders a black line between points (69, 154) and (262, 147).
; PLAN: r0=69(x1), r1=154(y1), r2=262(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 154
LDI r2, 262
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
