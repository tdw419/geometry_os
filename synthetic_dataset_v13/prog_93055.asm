; DESCRIPTION: Composite: Draws a orange circle centered at (440, 182) with radius 31 then Draws a yellow line from (436, 222) to (146, 195) then Draws a purple rectangle at (154, 225) with width 15 and height 11.
; PLAN: r0=440(x), r1=182(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=222(y1), r7=146(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=225(y), r12=15(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 182
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 222
LDI r7, 146
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 225
LDI r12, 15
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
