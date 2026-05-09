; DESCRIPTION: Composite: Creates a purple circular shape at (362, 152) with radius 17 then Places a black line segment connecting (100, 180) to (426, 42) then Draws a yellow rectangle at (459, 85) with width 45 and height 19.
; PLAN: r0=362(x), r1=152(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=180(y1), r7=426(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=85(y), r12=45(width), r13=19(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 152
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 180
LDI r7, 426
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 85
LDI r12, 45
LDI r13, 19
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
