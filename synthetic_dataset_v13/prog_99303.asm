; DESCRIPTION: Renders a magenta line between points (296, 112) and (506, 154).
; PLAN: r0=296(x1), r1=112(y1), r2=506(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 112
LDI r2, 506
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
