; DESCRIPTION: Composite: Places a purple line segment connecting (323, 120) to (105, 44) then Places a black circle of radius 15 at center (319, 60) then Draws a orange rectangle at (72, 239) with width 28 and height 11.
; PLAN: r0=323(x1), r1=120(y1), r2=105(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=60(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=239(y), r12=28(width), r13=11(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 120
LDI r2, 105
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 60
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 239
LDI r12, 28
LDI r13, 11
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
