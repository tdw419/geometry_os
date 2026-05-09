; DESCRIPTION: Composite: Draws a red circle centered at (470, 31) with radius 24 then Places a green line segment connecting (332, 230) to (341, 19) then Draws a black rectangle at (239, 187) with width 54 and height 27.
; PLAN: r0=470(x), r1=31(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=230(y1), r7=341(x2), r8=19(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=187(y), r12=54(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 31
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 230
LDI r7, 341
LDI r8, 19
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 187
LDI r12, 54
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
