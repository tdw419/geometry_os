; DESCRIPTION: Composite: Draws a cyan line from (152, 254) to (114, 126) then Places a magenta circle of radius 59 at center (427, 64) then Draws a white rectangle at (378, 170) with width 78 and height 31.
; PLAN: r0=152(x1), r1=254(y1), r2=114(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=64(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x), r11=170(y), r12=78(width), r13=31(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 254
LDI r2, 114
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 64
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 170
LDI r12, 78
LDI r13, 31
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
