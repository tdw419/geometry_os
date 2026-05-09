; DESCRIPTION: Composite: Draws a green rectangle at (15, 95) with width 72 and height 13 then Places a white line segment connecting (260, 243) to (320, 245) then Creates a white circular shape at (355, 66) with radius 14.
; PLAN: r0=15(x), r1=95(y), r2=72(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=243(y1), r7=320(x2), r8=245(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=66(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 95
LDI r2, 72
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 243
LDI r7, 320
LDI r8, 245
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 66
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
