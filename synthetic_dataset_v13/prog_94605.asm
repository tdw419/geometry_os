; DESCRIPTION: Renders a yellow line between points (248, 40) and (285, 154).
; PLAN: r0=248(x1), r1=40(y1), r2=285(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 40
LDI r2, 285
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
