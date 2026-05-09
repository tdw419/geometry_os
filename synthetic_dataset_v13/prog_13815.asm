; DESCRIPTION: Composite: Places a purple 56x64 rectangle at position (113, 175) then Renders a white disk with center (355, 138) and radius 14 then Renders a black line between points (144, 155) and (129, 108).
; PLAN: r0=113(x), r1=175(y), r2=56(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=138(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x1), r11=155(y1), r12=129(x2), r13=108(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 175
LDI r2, 56
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 138
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 155
LDI r12, 129
LDI r13, 108
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
