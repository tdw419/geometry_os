; DESCRIPTION: Composite: Creates a green circular shape at (151, 88) with radius 68 then Places a blue line segment connecting (478, 242) to (309, 88) then Draws a orange rectangle at (32, 45) with width 93 and height 76.
; PLAN: r0=151(x), r1=88(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=242(y1), r7=309(x2), r8=88(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=45(y), r12=93(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 88
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 242
LDI r7, 309
LDI r8, 88
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 45
LDI r12, 93
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
