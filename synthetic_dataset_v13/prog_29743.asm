; DESCRIPTION: Composite: Sets a single orange pixel at (495, 35) then Renders a red disk with center (108, 219) and radius 18 then Places a purple 72x67 rectangle at position (116, 155).
; PLAN: r0=495(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=219(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=155(y), r12=72(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 108
LDI r6, 219
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 155
LDI r12, 72
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
