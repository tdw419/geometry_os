; DESCRIPTION: Composite: Places a cyan line segment connecting (479, 68) to (1, 143) then Places a purple circle of radius 39 at center (126, 81) then Creates a black rectangular region at (261, 98) spanning 13 by 77 pixels.
; PLAN: r0=479(x1), r1=68(y1), r2=1(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=81(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=98(y), r12=13(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 68
LDI r2, 1
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 81
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 98
LDI r12, 13
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
