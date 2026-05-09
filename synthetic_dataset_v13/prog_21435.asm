; DESCRIPTION: Composite: Creates a orange rectangular region at (278, 54) spanning 16 by 101 pixels then Places a green line segment connecting (340, 221) to (201, 27) then Places a white circle of radius 76 at center (366, 111).
; PLAN: r0=278(x), r1=54(y), r2=16(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=221(y1), r7=201(x2), r8=27(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=111(y), r12=76(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 54
LDI r2, 16
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 221
LDI r7, 201
LDI r8, 27
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 111
LDI r12, 76
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
