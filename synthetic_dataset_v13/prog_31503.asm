; DESCRIPTION: Composite: Sets a single red pixel at (123, 245) then Draws a cyan circle centered at (214, 144) with radius 33 then Places a magenta 44x55 rectangle at position (203, 88).
; PLAN: r0=123(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=144(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=88(y), r12=44(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 144
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 88
LDI r12, 44
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
