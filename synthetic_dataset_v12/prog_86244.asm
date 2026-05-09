; DESCRIPTION: Composite: Places a purple dot at position (474, 218) then Places a red 43x47 rectangle at position (428, 77) then Creates a black circular shape at (406, 119) with radius 65.
; PLAN: r0=474(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=77(y), r7=43(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=119(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 474
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 77
LDI r7, 43
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 119
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
