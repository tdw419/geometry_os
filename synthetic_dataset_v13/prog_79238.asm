; DESCRIPTION: Composite: Draws a cyan rectangle at (402, 149) with width 97 and height 48 then Places a red line segment connecting (386, 144) to (191, 8) then Draws a black circle centered at (405, 185) with radius 56.
; PLAN: r0=402(x), r1=149(y), r2=97(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x1), r6=144(y1), r7=191(x2), r8=8(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=185(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 149
LDI r2, 97
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 144
LDI r7, 191
LDI r8, 8
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 185
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
