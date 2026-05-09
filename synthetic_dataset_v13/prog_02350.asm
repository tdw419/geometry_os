; DESCRIPTION: Composite: Places a white line segment connecting (222, 54) to (52, 84) then Creates a blue circular shape at (102, 182) with radius 35 then Renders a magenta box of size 31x118 starting at (361, 48).
; PLAN: r0=222(x1), r1=54(y1), r2=52(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=182(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=48(y), r12=31(width), r13=118(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 54
LDI r2, 52
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 182
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 48
LDI r12, 31
LDI r13, 118
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
