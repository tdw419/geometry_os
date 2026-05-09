; DESCRIPTION: Composite: Sets a single magenta pixel at (152, 175) then Creates a black circular shape at (388, 66) with radius 58 then Renders a magenta box of size 68x91 starting at (112, 40).
; PLAN: r0=152(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=66(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x), r11=40(y), r12=68(width), r13=91(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 66
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 40
LDI r12, 68
LDI r13, 91
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
