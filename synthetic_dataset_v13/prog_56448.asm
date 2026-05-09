; DESCRIPTION: Composite: Renders a white line between points (324, 255) and (30, 218) then Draws a cyan rectangle at (430, 2) with width 49 and height 34 then Renders a yellow disk with center (308, 110) and radius 13.
; PLAN: r0=324(x1), r1=255(y1), r2=30(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=2(y), r7=49(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=110(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 255
LDI r2, 30
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 2
LDI r7, 49
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 110
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
