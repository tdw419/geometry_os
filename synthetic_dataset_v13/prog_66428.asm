; DESCRIPTION: Composite: Draws a yellow line from (78, 197) to (190, 129) then Places a white circle of radius 43 at center (274, 115) then Creates a blue rectangular region at (40, 111) spanning 97 by 81 pixels.
; PLAN: r0=78(x1), r1=197(y1), r2=190(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=115(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=111(y), r12=97(width), r13=81(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 197
LDI r2, 190
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 115
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 111
LDI r12, 97
LDI r13, 81
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
