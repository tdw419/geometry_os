; DESCRIPTION: Composite: Places a orange circle of radius 58 at center (340, 158) then Draws a green rectangle at (298, 98) with width 32 and height 110 then Draws a purple line from (246, 214) to (126, 98).
; PLAN: r0=340(x), r1=158(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=98(y), r7=32(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x1), r11=214(y1), r12=126(x2), r13=98(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 158
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 98
LDI r7, 32
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 214
LDI r12, 126
LDI r13, 98
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
