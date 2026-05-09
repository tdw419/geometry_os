; DESCRIPTION: Renders a yellow line between points (176, 142) and (481, 154).
; PLAN: r0=176(x1), r1=142(y1), r2=481(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 142
LDI r2, 481
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
