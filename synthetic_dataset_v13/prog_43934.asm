; DESCRIPTION: Composite: Draws a green circle centered at (130, 139) with radius 30 then Places a yellow 28x50 rectangle at position (268, 54) then Places a white line segment connecting (260, 235) to (339, 18).
; PLAN: r0=130(x), r1=139(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=54(y), r7=28(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x1), r11=235(y1), r12=339(x2), r13=18(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 139
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 54
LDI r7, 28
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 235
LDI r12, 339
LDI r13, 18
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
