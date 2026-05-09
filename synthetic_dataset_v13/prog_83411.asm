; DESCRIPTION: Composite: Creates a purple circular shape at (152, 88) with radius 22 then Creates a red rectangular region at (188, 131) spanning 28 by 107 pixels.
; PLAN: r0=152(x), r1=88(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=131(y), r7=28(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 88
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 131
LDI r7, 28
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
