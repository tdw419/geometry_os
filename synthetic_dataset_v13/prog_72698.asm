; DESCRIPTION: Composite: Draws a cyan circle centered at (335, 24) with radius 20 then Draws a purple rectangle at (338, 50) with width 113 and height 117 then Places a orange line segment connecting (354, 45) to (198, 50).
; PLAN: r0=335(x), r1=24(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=50(y), r7=113(width), r8=117(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x1), r11=45(y1), r12=198(x2), r13=50(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 24
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 50
LDI r7, 113
LDI r8, 117
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 45
LDI r12, 198
LDI r13, 50
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
