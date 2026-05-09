; DESCRIPTION: Composite: Places a red line segment connecting (459, 25) to (256, 65) then Draws a green circle centered at (445, 192) with radius 41 then Draws a red rectangle at (281, 19) with width 96 and height 95.
; PLAN: r0=459(x1), r1=25(y1), r2=256(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=192(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=19(y), r12=96(width), r13=95(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 25
LDI r2, 256
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 192
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 19
LDI r12, 96
LDI r13, 95
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
