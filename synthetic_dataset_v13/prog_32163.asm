; DESCRIPTION: Composite: Places a green dot at position (34, 108) then Places a blue circle of radius 49 at center (88, 170) then Creates a cyan rectangular region at (297, 147) spanning 101 by 50 pixels.
; PLAN: r0=34(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=170(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=147(y), r12=101(width), r13=50(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 88
LDI r6, 170
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 147
LDI r12, 101
LDI r13, 50
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
