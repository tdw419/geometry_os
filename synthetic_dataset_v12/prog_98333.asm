; DESCRIPTION: Composite: Places a purple line segment connecting (225, 155) to (206, 247) then Renders a magenta box of size 42x79 starting at (119, 13) then Places a red circle of radius 40 at center (291, 111).
; PLAN: r0=225(x1), r1=155(y1), r2=206(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=13(y), r7=42(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=291(x), r11=111(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 155
LDI r2, 206
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 13
LDI r7, 42
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 111
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
