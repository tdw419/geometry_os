; DESCRIPTION: Composite: Sets a single white pixel at (468, 59) then Renders a magenta disk with center (115, 235) and radius 11 then Places a blue line segment connecting (357, 190) to (14, 100).
; PLAN: r0=468(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=235(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=190(y1), r12=14(x2), r13=100(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 235
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 190
LDI r12, 14
LDI r13, 100
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
