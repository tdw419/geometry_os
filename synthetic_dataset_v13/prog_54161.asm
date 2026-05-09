; DESCRIPTION: Composite: Creates a yellow circular shape at (178, 242) with radius 13 then Creates a black rectangular region at (303, 129) spanning 113 by 39 pixels then Places a blue line segment connecting (427, 92) to (190, 183).
; PLAN: r0=178(x), r1=242(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=129(y), r7=113(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x1), r11=92(y1), r12=190(x2), r13=183(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 242
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 129
LDI r7, 113
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 92
LDI r12, 190
LDI r13, 183
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
