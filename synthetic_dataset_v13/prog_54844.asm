; DESCRIPTION: Places a red line segment connecting (279, 224) to (249, 154).
; PLAN: r0=279(x1), r1=224(y1), r2=249(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 224
LDI r2, 249
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
