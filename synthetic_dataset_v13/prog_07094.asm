; DESCRIPTION: Composite: Creates a green circular shape at (442, 115) with radius 49 then Draws a purple line from (34, 92) to (241, 71) then Draws a cyan rectangle at (373, 97) with width 23 and height 62.
; PLAN: r0=442(x), r1=115(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x1), r6=92(y1), r7=241(x2), r8=71(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=97(y), r12=23(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 115
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 92
LDI r7, 241
LDI r8, 71
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 97
LDI r12, 23
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
