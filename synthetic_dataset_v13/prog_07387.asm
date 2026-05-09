; DESCRIPTION: Composite: Draws a cyan rectangle at (83, 117) with width 104 and height 49 then Places a yellow circle of radius 55 at center (248, 105) then Places a magenta line segment connecting (375, 230) to (32, 150).
; PLAN: r0=83(x), r1=117(y), r2=104(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=105(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x1), r11=230(y1), r12=32(x2), r13=150(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 117
LDI r2, 104
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 105
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 230
LDI r12, 32
LDI r13, 150
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
