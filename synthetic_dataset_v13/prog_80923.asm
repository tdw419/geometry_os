; DESCRIPTION: Places a black line segment connecting (364, 248) to (116, 154).
; PLAN: r0=364(x1), r1=248(y1), r2=116(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 248
LDI r2, 116
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
