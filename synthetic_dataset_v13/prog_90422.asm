; DESCRIPTION: Composite: Creates a red rectangular region at (365, 58) spanning 43 by 56 pixels then Places a black line segment connecting (224, 16) to (210, 224) then Creates a black circular shape at (143, 90) with radius 53.
; PLAN: r0=365(x), r1=58(y), r2=43(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=16(y1), r7=210(x2), r8=224(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=90(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 58
LDI r2, 43
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 16
LDI r7, 210
LDI r8, 224
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 90
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
