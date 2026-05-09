; DESCRIPTION: Composite: Places a magenta circle of radius 63 at center (381, 182) then Sets a single magenta pixel at (151, 97) then Places a red line segment connecting (154, 37) to (169, 216).
; PLAN: r0=381(x), r1=182(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=97(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=37(y1), r12=169(x2), r13=216(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 182
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 97
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 37
LDI r12, 169
LDI r13, 216
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
