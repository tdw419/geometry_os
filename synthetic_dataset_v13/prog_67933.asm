; DESCRIPTION: Composite: Renders a green box of size 79x63 starting at (128, 170) then Places a red line segment connecting (215, 30) to (298, 75) then Draws a red circle centered at (344, 108) with radius 38.
; PLAN: r0=128(x), r1=170(y), r2=79(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=30(y1), r7=298(x2), r8=75(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=108(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 170
LDI r2, 79
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 30
LDI r7, 298
LDI r8, 75
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 108
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
