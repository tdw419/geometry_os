; DESCRIPTION: Composite: Places a cyan dot at position (2, 250) then Places a green line segment connecting (225, 104) to (259, 22) then Draws a yellow rectangle at (331, 166) with width 61 and height 19.
; PLAN: r0=2(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=104(y1), r7=259(x2), r8=22(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=166(y), r12=61(width), r13=19(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 104
LDI r7, 259
LDI r8, 22
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 166
LDI r12, 61
LDI r13, 19
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
