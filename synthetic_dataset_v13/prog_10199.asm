; DESCRIPTION: Composite: Places a green dot at position (267, 135) then Places a red circle of radius 78 at center (131, 85) then Places a magenta 88x114 rectangle at position (57, 9).
; PLAN: r0=267(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=85(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=9(y), r12=88(width), r13=114(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 131
LDI r6, 85
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 9
LDI r12, 88
LDI r13, 114
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
