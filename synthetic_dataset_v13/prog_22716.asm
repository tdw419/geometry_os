; DESCRIPTION: Composite: Creates a orange circular shape at (279, 209) with radius 19 then Draws a purple line from (150, 225) to (338, 176) then Draws a black rectangle at (94, 161) with width 98 and height 90.
; PLAN: r0=279(x), r1=209(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x1), r6=225(y1), r7=338(x2), r8=176(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=94(x), r11=161(y), r12=98(width), r13=90(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 209
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 225
LDI r7, 338
LDI r8, 176
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 161
LDI r12, 98
LDI r13, 90
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
