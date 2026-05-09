; DESCRIPTION: Composite: Sets a single orange pixel at (495, 141) then Places a blue circle of radius 67 at center (415, 133) then Renders a black box of size 74x103 starting at (57, 0).
; PLAN: r0=495(x), r1=141(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=133(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=0(y), r12=74(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 141
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 415
LDI r6, 133
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 0
LDI r12, 74
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
