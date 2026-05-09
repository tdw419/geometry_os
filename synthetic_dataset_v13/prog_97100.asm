; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 187) then Draws a white rectangle at (344, 149) with width 108 and height 86 then Places a blue circle of radius 24 at center (482, 62).
; PLAN: r0=203(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=149(y), r7=108(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=62(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 149
LDI r7, 108
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 62
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
