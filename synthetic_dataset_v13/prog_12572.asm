; DESCRIPTION: Composite: Sets a single blue pixel at (379, 228) then Creates a magenta circular shape at (130, 223) with radius 23 then Renders a blue box of size 90x106 starting at (358, 34).
; PLAN: r0=379(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=223(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=34(y), r12=90(width), r13=106(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 228
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 223
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 34
LDI r12, 90
LDI r13, 106
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
