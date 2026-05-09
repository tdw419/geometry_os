; DESCRIPTION: Composite: Creates a magenta circular shape at (193, 104) with radius 54 then Creates a purple rectangular region at (414, 11) spanning 67 by 111 pixels then Places a green dot at position (364, 220).
; PLAN: r0=193(x), r1=104(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=11(y), r7=67(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=220(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 104
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 11
LDI r7, 67
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 220
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
