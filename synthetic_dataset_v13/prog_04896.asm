; DESCRIPTION: Composite: Places a magenta circle of radius 19 at center (450, 73) then Places a purple line segment connecting (206, 224) to (495, 98) then Places a red 11x88 rectangle at position (341, 79).
; PLAN: r0=450(x), r1=73(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x1), r6=224(y1), r7=495(x2), r8=98(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=79(y), r12=11(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 73
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 224
LDI r7, 495
LDI r8, 98
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 79
LDI r12, 11
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
