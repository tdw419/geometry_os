; DESCRIPTION: Composite: Sets a single purple pixel at (485, 3) then Draws a yellow rectangle at (259, 169) with width 95 and height 30 then Places a green circle of radius 40 at center (402, 129).
; PLAN: r0=485(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=169(y), r7=95(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=129(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 485
LDI r1, 3
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 169
LDI r7, 95
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 129
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
