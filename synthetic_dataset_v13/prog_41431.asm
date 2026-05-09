; DESCRIPTION: Composite: Draws a blue circle centered at (382, 21) with radius 12 then Renders a yellow line between points (127, 204) and (230, 128) then Renders a yellow box of size 45x35 starting at (174, 0).
; PLAN: r0=382(x), r1=21(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=204(y1), r7=230(x2), r8=128(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=0(y), r12=45(width), r13=35(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 21
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 204
LDI r7, 230
LDI r8, 128
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 0
LDI r12, 45
LDI r13, 35
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
