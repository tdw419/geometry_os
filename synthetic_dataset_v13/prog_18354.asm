; DESCRIPTION: Composite: Sets a single blue pixel at (152, 101) then Creates a magenta circular shape at (186, 158) with radius 28 then Places a red 111x91 rectangle at position (109, 37).
; PLAN: r0=152(x), r1=101(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=158(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x), r11=37(y), r12=111(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 101
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 158
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 37
LDI r12, 111
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
