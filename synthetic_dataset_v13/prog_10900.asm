; DESCRIPTION: Composite: Places a purple circle of radius 12 at center (450, 203) then Places a blue line segment connecting (231, 27) to (320, 68) then Renders a purple box of size 75x43 starting at (2, 101).
; PLAN: r0=450(x), r1=203(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x1), r6=27(y1), r7=320(x2), r8=68(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=101(y), r12=75(width), r13=43(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 203
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 27
LDI r7, 320
LDI r8, 68
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 101
LDI r12, 75
LDI r13, 43
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
