; DESCRIPTION: Composite: Draws a blue circle centered at (204, 80) with radius 41 then Places a black line segment connecting (260, 152) to (131, 206) then Draws a white rectangle at (279, 111) with width 114 and height 47.
; PLAN: r0=204(x), r1=80(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=152(y1), r7=131(x2), r8=206(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=111(y), r12=114(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 80
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 152
LDI r7, 131
LDI r8, 206
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 111
LDI r12, 114
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
