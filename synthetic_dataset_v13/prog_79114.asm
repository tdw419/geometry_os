; DESCRIPTION: Composite: Places a yellow 77x110 rectangle at position (192, 113) then Places a cyan line segment connecting (170, 224) to (368, 103) then Places a purple circle of radius 80 at center (162, 111).
; PLAN: r0=192(x), r1=113(y), r2=77(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=224(y1), r7=368(x2), r8=103(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=111(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 192
LDI r1, 113
LDI r2, 77
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 224
LDI r7, 368
LDI r8, 103
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 111
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
