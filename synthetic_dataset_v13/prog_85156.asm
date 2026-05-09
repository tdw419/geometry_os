; DESCRIPTION: Renders a black line between points (29, 168) and (341, 154).
; PLAN: r0=29(x1), r1=168(y1), r2=341(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 168
LDI r2, 341
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
