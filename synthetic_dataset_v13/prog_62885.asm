; DESCRIPTION: Places a magenta line segment connecting (353, 109) to (118, 154).
; PLAN: r0=353(x1), r1=109(y1), r2=118(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 109
LDI r2, 118
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
