; DESCRIPTION: Renders a magenta line between points (176, 130) and (49, 154).
; PLAN: r0=176(x1), r1=130(y1), r2=49(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 130
LDI r2, 49
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
