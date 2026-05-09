; DESCRIPTION: Composite: Places a orange line segment connecting (164, 225) to (402, 245) then Draws a cyan rectangle at (259, 2) with width 111 and height 104 then Places a green dot at position (114, 148).
; PLAN: r0=164(x1), r1=225(y1), r2=402(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=2(y), r7=111(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=148(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 225
LDI r2, 402
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 2
LDI r7, 111
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 148
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
