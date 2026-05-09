; DESCRIPTION: Composite: Creates a orange rectangular region at (336, 67) spanning 94 by 120 pixels then Creates a orange circular shape at (261, 116) with radius 26.
; PLAN: r0=336(x), r1=67(y), r2=94(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=116(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 67
LDI r2, 94
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 116
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
