; DESCRIPTION: Composite: Renders a white disk with center (396, 86) and radius 28 then Places a black 35x110 rectangle at position (446, 46) then Places a yellow line segment connecting (468, 198) to (2, 237).
; PLAN: r0=396(x), r1=86(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=46(y), r7=35(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x1), r11=198(y1), r12=2(x2), r13=237(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 86
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 46
LDI r7, 35
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 198
LDI r12, 2
LDI r13, 237
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
