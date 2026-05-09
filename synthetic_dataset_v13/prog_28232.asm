; DESCRIPTION: Composite: Creates a magenta circular shape at (120, 85) with radius 64 then Renders a yellow line between points (482, 249) and (35, 32) then Draws a black rectangle at (325, 171) with width 37 and height 46.
; PLAN: r0=120(x), r1=85(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=249(y1), r7=35(x2), r8=32(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=171(y), r12=37(width), r13=46(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 85
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 249
LDI r7, 35
LDI r8, 32
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 171
LDI r12, 37
LDI r13, 46
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
