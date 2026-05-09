; DESCRIPTION: Renders a white line between points (111, 115) and (189, 154).
; PLAN: r0=111(x1), r1=115(y1), r2=189(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 115
LDI r2, 189
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
