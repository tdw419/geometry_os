; DESCRIPTION: Composite: Draws a blue circle centered at (397, 214) with radius 29 then Places a black line segment connecting (112, 173) to (187, 28) then Draws a cyan rectangle at (435, 219) with width 64 and height 37.
; PLAN: r0=397(x), r1=214(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=173(y1), r7=187(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=219(y), r12=64(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 214
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 173
LDI r7, 187
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 219
LDI r12, 64
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
