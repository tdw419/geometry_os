; DESCRIPTION: Composite: Renders a green box of size 80x81 starting at (274, 76) then Creates a red circular shape at (97, 76) with radius 70 then Places a yellow line segment connecting (21, 210) to (290, 90).
; PLAN: r0=274(x), r1=76(y), r2=80(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=76(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x1), r11=210(y1), r12=290(x2), r13=90(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 76
LDI r2, 80
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 76
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 210
LDI r12, 290
LDI r13, 90
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
