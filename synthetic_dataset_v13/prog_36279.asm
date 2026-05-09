; DESCRIPTION: Composite: Renders a black line between points (278, 210) and (414, 200) then Renders a black disk with center (174, 177) and radius 72 then Renders a black box of size 67x101 starting at (338, 113).
; PLAN: r0=278(x1), r1=210(y1), r2=414(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=177(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=113(y), r12=67(width), r13=101(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 210
LDI r2, 414
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 177
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 113
LDI r12, 67
LDI r13, 101
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
