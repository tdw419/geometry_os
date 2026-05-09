; DESCRIPTION: Composite: Draws a purple line from (136, 98) to (440, 16) then Places a green circle of radius 12 at center (224, 102) then Renders a yellow box of size 64x97 starting at (41, 121).
; PLAN: r0=136(x1), r1=98(y1), r2=440(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=102(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x), r11=121(y), r12=64(width), r13=97(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 98
LDI r2, 440
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 102
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 121
LDI r12, 64
LDI r13, 97
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
