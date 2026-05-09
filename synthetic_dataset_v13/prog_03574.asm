; DESCRIPTION: Renders a yellow line between points (420, 167) and (455, 154).
; PLAN: r0=420(x1), r1=167(y1), r2=455(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 167
LDI r2, 455
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
