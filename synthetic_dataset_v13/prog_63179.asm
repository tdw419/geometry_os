; DESCRIPTION: Composite: Creates a magenta rectangular region at (43, 159) spanning 116 by 70 pixels then Creates a magenta circular shape at (152, 164) with radius 14.
; PLAN: r0=43(x), r1=159(y), r2=116(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=164(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 159
LDI r2, 116
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 164
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
