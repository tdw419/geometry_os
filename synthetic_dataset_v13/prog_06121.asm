; DESCRIPTION: Composite: Sets a single purple pixel at (495, 166) then Draws a yellow circle centered at (321, 156) with radius 68 then Places a yellow 56x10 rectangle at position (69, 190).
; PLAN: r0=495(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=156(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=190(y), r12=56(width), r13=10(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 166
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 321
LDI r6, 156
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 190
LDI r12, 56
LDI r13, 10
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
