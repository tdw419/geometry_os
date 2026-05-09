; DESCRIPTION: Composite: Renders a black box of size 10x35 starting at (173, 154) then Creates a black circular shape at (354, 105) with radius 73 then Places a green line segment connecting (199, 148) to (67, 213).
; PLAN: r0=173(x), r1=154(y), r2=10(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=105(y), r7=73(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x1), r11=148(y1), r12=67(x2), r13=213(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 154
LDI r2, 10
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 105
LDI r7, 73
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 148
LDI r12, 67
LDI r13, 213
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
