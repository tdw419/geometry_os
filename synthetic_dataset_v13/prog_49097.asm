; DESCRIPTION: Composite: Creates a yellow circular shape at (148, 217) with radius 34 then Creates a magenta rectangular region at (320, 169) spanning 69 by 16 pixels.
; PLAN: r0=148(x), r1=217(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=169(y), r7=69(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 217
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 169
LDI r7, 69
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
