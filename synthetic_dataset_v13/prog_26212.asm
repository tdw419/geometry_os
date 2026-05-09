; DESCRIPTION: Composite: Creates a red rectangular region at (173, 36) spanning 87 by 45 pixels then Creates a red circular shape at (184, 188) with radius 54.
; PLAN: r0=173(x), r1=36(y), r2=87(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=188(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 36
LDI r2, 87
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 188
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
