; DESCRIPTION: Composite: Creates a blue rectangular region at (465, 8) spanning 26 by 116 pixels then Creates a yellow circular shape at (317, 171) with radius 64.
; PLAN: r0=465(x), r1=8(y), r2=26(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=171(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 465
LDI r1, 8
LDI r2, 26
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 171
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
