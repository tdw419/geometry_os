; DESCRIPTION: Composite: Places a white 28x86 rectangle at position (2, 96) then Creates a blue circular shape at (112, 102) with radius 46 then Places a purple line segment connecting (118, 152) to (119, 201).
; PLAN: r0=2(x), r1=96(y), r2=28(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=102(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x1), r11=152(y1), r12=119(x2), r13=201(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 96
LDI r2, 28
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 102
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 152
LDI r12, 119
LDI r13, 201
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
