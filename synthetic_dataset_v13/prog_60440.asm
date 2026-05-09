; DESCRIPTION: Composite: Sets a single white pixel at (423, 254) then Creates a white rectangular region at (287, 163) spanning 30 by 74 pixels then Draws a cyan circle centered at (91, 128) with radius 31.
; PLAN: r0=423(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=163(y), r7=30(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=128(y), r12=31(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 254
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 163
LDI r7, 30
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 128
LDI r12, 31
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
