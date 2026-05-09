; DESCRIPTION: Composite: Renders a white disk with center (435, 147) and radius 54 then Places a yellow line segment connecting (299, 210) to (463, 5) then Draws a purple rectangle at (341, 20) with width 62 and height 30.
; PLAN: r0=435(x), r1=147(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=210(y1), r7=463(x2), r8=5(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=20(y), r12=62(width), r13=30(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 147
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 210
LDI r7, 463
LDI r8, 5
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 20
LDI r12, 62
LDI r13, 30
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
