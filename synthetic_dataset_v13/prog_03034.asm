; DESCRIPTION: Composite: Draws a white rectangle at (76, 205) with width 12 and height 22 then Renders a white line between points (438, 45) and (197, 218) then Places a green circle of radius 74 at center (133, 87).
; PLAN: r0=76(x), r1=205(y), r2=12(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=45(y1), r7=197(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=87(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 205
LDI r2, 12
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 45
LDI r7, 197
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 87
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
