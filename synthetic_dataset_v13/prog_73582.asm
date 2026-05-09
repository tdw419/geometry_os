; DESCRIPTION: Composite: Places a black line segment connecting (508, 87) to (230, 21) then Creates a cyan circular shape at (175, 162) with radius 59 then Draws a purple rectangle at (34, 69) with width 30 and height 57.
; PLAN: r0=508(x1), r1=87(y1), r2=230(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=162(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=69(y), r12=30(width), r13=57(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 87
LDI r2, 230
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 162
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 69
LDI r12, 30
LDI r13, 57
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
