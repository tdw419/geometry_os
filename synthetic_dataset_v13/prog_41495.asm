; DESCRIPTION: Composite: Draws a orange rectangle at (330, 74) with width 83 and height 50 then Draws a blue line from (239, 65) to (271, 181) then Creates a purple circular shape at (346, 100) with radius 49.
; PLAN: r0=330(x), r1=74(y), r2=83(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=65(y1), r7=271(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=100(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 74
LDI r2, 83
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 65
LDI r7, 271
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 100
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
