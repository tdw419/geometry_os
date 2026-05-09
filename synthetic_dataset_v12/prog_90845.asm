; DESCRIPTION: Composite: Sets a single cyan pixel at (366, 127) then Places a white line segment connecting (53, 139) to (116, 232) then Creates a red rectangular region at (275, 29) spanning 98 by 58 pixels.
; PLAN: r0=366(x), r1=127(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x1), r6=139(y1), r7=116(x2), r8=232(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=29(y), r12=98(width), r13=58(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 127
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 139
LDI r7, 116
LDI r8, 232
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 29
LDI r12, 98
LDI r13, 58
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
