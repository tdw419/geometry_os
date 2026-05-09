; DESCRIPTION: Renders a red line between points (76, 222) and (163, 154).
; PLAN: r0=76(x1), r1=222(y1), r2=163(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 222
LDI r2, 163
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
