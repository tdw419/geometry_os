; DESCRIPTION: Composite: Draws a cyan rectangle at (418, 83) with width 85 and height 65 then Places a magenta line segment connecting (144, 92) to (508, 145) then Renders a green disk with center (454, 157) and radius 34.
; PLAN: r0=418(x), r1=83(y), r2=85(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=92(y1), r7=508(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=157(y), r12=34(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 83
LDI r2, 85
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 92
LDI r7, 508
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 157
LDI r12, 34
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
