; DESCRIPTION: Composite: Places a purple line segment connecting (230, 200) to (365, 189) then Draws a cyan rectangle at (203, 7) with width 17 and height 25 then Creates a magenta circular shape at (267, 91) with radius 56.
; PLAN: r0=230(x1), r1=200(y1), r2=365(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=7(y), r7=17(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=91(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 200
LDI r2, 365
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 7
LDI r7, 17
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 91
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
