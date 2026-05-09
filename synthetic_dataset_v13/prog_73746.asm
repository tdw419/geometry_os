; DESCRIPTION: Composite: Places a purple circle of radius 53 at center (297, 56) then Creates a white rectangular region at (431, 84) spanning 47 by 100 pixels then Places a purple dot at position (192, 43).
; PLAN: r0=297(x), r1=56(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=84(y), r7=47(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=43(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 56
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 84
LDI r7, 47
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 43
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
