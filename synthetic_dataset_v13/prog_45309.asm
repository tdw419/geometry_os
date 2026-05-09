; DESCRIPTION: Places a magenta line segment connecting (7, 182) to (205, 192).
; PLAN: r0=7(x1), r1=182(y1), r2=205(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 182
LDI r2, 205
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
