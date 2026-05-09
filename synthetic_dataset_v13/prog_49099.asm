; DESCRIPTION: Renders a red line between points (466, 227) and (222, 154).
; PLAN: r0=466(x1), r1=227(y1), r2=222(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 227
LDI r2, 222
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
