; DESCRIPTION: Composite: Places a purple line segment connecting (134, 249) to (248, 86) then Creates a cyan circular shape at (289, 95) with radius 44 then Draws a green rectangle at (382, 46) with width 116 and height 16.
; PLAN: r0=134(x1), r1=249(y1), r2=248(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=95(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=46(y), r12=116(width), r13=16(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 249
LDI r2, 248
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 95
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 46
LDI r12, 116
LDI r13, 16
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
