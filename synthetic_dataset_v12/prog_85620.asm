; DESCRIPTION: Composite: Places a white line segment connecting (295, 242) to (298, 231) then Places a green 17x117 rectangle at position (290, 19) then Draws a purple circle centered at (222, 101) with radius 64.
; PLAN: r0=295(x1), r1=242(y1), r2=298(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=19(y), r7=17(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=101(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 242
LDI r2, 298
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 19
LDI r7, 17
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 101
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
