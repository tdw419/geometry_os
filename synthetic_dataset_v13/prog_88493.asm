; DESCRIPTION: Composite: Creates a black circular shape at (344, 68) with radius 46 then Places a cyan line segment connecting (49, 114) to (294, 123) then Creates a purple rectangular region at (114, 111) spanning 61 by 74 pixels.
; PLAN: r0=344(x), r1=68(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=114(y1), r7=294(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=111(y), r12=61(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 68
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 114
LDI r7, 294
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 111
LDI r12, 61
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
