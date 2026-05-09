; DESCRIPTION: Composite: Draws a red line from (173, 202) to (26, 110) then Draws a blue rectangle at (341, 135) with width 29 and height 120 then Draws a purple circle centered at (263, 129) with radius 46.
; PLAN: r0=173(x1), r1=202(y1), r2=26(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=135(y), r7=29(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=129(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 202
LDI r2, 26
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 135
LDI r7, 29
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 129
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
