; DESCRIPTION: Composite: Draws a black rectangle at (290, 173) with width 22 and height 11 then Places a blue line segment connecting (218, 175) to (183, 139) then Places a green dot at position (30, 54).
; PLAN: r0=290(x), r1=173(y), r2=22(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x1), r6=175(y1), r7=183(x2), r8=139(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=54(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 173
LDI r2, 22
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 175
LDI r7, 183
LDI r8, 139
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 54
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
