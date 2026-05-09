; DESCRIPTION: Composite: Places a red 85x44 rectangle at position (320, 56) then Draws a blue line from (376, 157) to (259, 13) then Draws a red circle centered at (442, 99) with radius 50.
; PLAN: r0=320(x), r1=56(y), r2=85(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x1), r6=157(y1), r7=259(x2), r8=13(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=99(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 56
LDI r2, 85
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 157
LDI r7, 259
LDI r8, 13
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 99
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
