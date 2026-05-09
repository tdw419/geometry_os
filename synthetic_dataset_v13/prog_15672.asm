; DESCRIPTION: Composite: Places a yellow line segment connecting (69, 230) to (299, 130) then Draws a black circle centered at (54, 132) with radius 34 then Renders a yellow box of size 65x55 starting at (393, 20).
; PLAN: r0=69(x1), r1=230(y1), r2=299(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=132(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=20(y), r12=65(width), r13=55(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 230
LDI r2, 299
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 132
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 20
LDI r12, 65
LDI r13, 55
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
