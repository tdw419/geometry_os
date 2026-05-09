; DESCRIPTION: Composite: Sets a single blue pixel at (343, 100) then Places a green circle of radius 68 at center (318, 177) then Places a magenta 46x50 rectangle at position (11, 50).
; PLAN: r0=343(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=177(y), r7=68(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=50(y), r12=46(width), r13=50(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 177
LDI r7, 68
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 50
LDI r12, 46
LDI r13, 50
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
