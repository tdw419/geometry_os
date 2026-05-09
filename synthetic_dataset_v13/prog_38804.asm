; DESCRIPTION: Composite: Places a black line segment connecting (294, 55) to (20, 65) then Renders a yellow box of size 73x37 starting at (46, 136) then Places a white circle of radius 23 at center (468, 203).
; PLAN: r0=294(x1), r1=55(y1), r2=20(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=136(y), r7=73(width), r8=37(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x), r11=203(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 294
LDI r1, 55
LDI r2, 20
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 136
LDI r7, 73
LDI r8, 37
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 203
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
