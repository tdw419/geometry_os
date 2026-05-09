; DESCRIPTION: Composite: Sets a single black pixel at (57, 208) then Draws a purple circle centered at (366, 68) with radius 54 then Renders a magenta box of size 88x12 starting at (11, 47).
; PLAN: r0=57(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=68(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=47(y), r12=88(width), r13=12(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 366
LDI r6, 68
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 47
LDI r12, 88
LDI r13, 12
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
