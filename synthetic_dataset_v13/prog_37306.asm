; DESCRIPTION: Composite: Renders a purple box of size 69x56 starting at (201, 104) then Places a green dot at position (320, 124) then Creates a green circular shape at (141, 203) with radius 19.
; PLAN: r0=201(x), r1=104(y), r2=69(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=124(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=203(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 104
LDI r2, 69
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 124
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 141
LDI r11, 203
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
