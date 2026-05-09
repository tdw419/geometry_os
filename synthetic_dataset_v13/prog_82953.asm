; DESCRIPTION: Composite: Sets a single blue pixel at (299, 19) then Renders a cyan disk with center (304, 139) and radius 40 then Draws a yellow rectangle at (208, 123) with width 104 and height 116.
; PLAN: r0=299(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=139(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x), r11=123(y), r12=104(width), r13=116(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 139
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 123
LDI r12, 104
LDI r13, 116
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
