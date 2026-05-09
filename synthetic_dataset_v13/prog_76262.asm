; DESCRIPTION: Renders a magenta line between points (256, 235) and (119, 154).
; PLAN: r0=256(x1), r1=235(y1), r2=119(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 235
LDI r2, 119
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
