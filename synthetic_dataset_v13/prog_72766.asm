; DESCRIPTION: Composite: Places a white dot at position (318, 252) then Renders a white disk with center (297, 123) and radius 54 then Renders a cyan box of size 45x75 starting at (104, 140).
; PLAN: r0=318(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=123(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=140(y), r12=45(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 123
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 140
LDI r12, 45
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
