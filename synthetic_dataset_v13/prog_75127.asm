; DESCRIPTION: Renders a purple line between points (296, 9) and (135, 154).
; PLAN: r0=296(x1), r1=9(y1), r2=135(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 9
LDI r2, 135
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
