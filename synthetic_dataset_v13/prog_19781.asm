; DESCRIPTION: Composite: Renders a blue line between points (192, 80) and (143, 11) then Draws a white circle centered at (70, 43) with radius 36 then Renders a blue box of size 39x86 starting at (94, 40).
; PLAN: r0=192(x1), r1=80(y1), r2=143(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=43(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=94(x), r11=40(y), r12=39(width), r13=86(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 80
LDI r2, 143
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 43
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 94
LDI r11, 40
LDI r12, 39
LDI r13, 86
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
