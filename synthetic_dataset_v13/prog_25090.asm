; DESCRIPTION: Composite: Sets a single green pixel at (62, 34) then Places a yellow line segment connecting (261, 245) to (385, 202) then Places a cyan 104x40 rectangle at position (53, 199).
; PLAN: r0=62(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=245(y1), r7=385(x2), r8=202(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=199(y), r12=104(width), r13=40(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 261
LDI r6, 245
LDI r7, 385
LDI r8, 202
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 199
LDI r12, 104
LDI r13, 40
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
