; DESCRIPTION: Composite: Draws a cyan rectangle at (274, 8) with width 13 and height 81 then Places a orange line segment connecting (510, 45) to (312, 208) then Renders a orange disk with center (319, 79) and radius 79.
; PLAN: r0=274(x), r1=8(y), r2=13(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x1), r6=45(y1), r7=312(x2), r8=208(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=79(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 8
LDI r2, 13
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 45
LDI r7, 312
LDI r8, 208
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 79
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
