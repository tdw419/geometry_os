; DESCRIPTION: Renders a white line between points (121, 248) and (242, 154).
; PLAN: r0=121(x1), r1=248(y1), r2=242(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 248
LDI r2, 242
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
