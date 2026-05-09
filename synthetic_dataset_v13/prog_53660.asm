; DESCRIPTION: Composite: Renders a green box of size 20x13 starting at (33, 138) then Creates a black circular shape at (341, 142) with radius 58 then Places a magenta line segment connecting (203, 61) to (214, 222).
; PLAN: r0=33(x), r1=138(y), r2=20(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=142(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x1), r11=61(y1), r12=214(x2), r13=222(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 138
LDI r2, 20
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 142
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 61
LDI r12, 214
LDI r13, 222
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
