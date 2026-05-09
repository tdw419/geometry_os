; DESCRIPTION: Composite: Places a green line segment connecting (497, 252) to (90, 30) then Places a cyan circle of radius 76 at center (316, 104) then Creates a cyan rectangular region at (154, 141) spanning 61 by 82 pixels.
; PLAN: r0=497(x1), r1=252(y1), r2=90(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=104(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=141(y), r12=61(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 252
LDI r2, 90
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 104
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 141
LDI r12, 61
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
