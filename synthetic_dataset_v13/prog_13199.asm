; DESCRIPTION: Composite: Creates a orange circular shape at (238, 167) with radius 61 then Creates a orange rectangular region at (353, 96) spanning 14 by 20 pixels.
; PLAN: r0=238(x), r1=167(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=96(y), r7=14(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 167
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 96
LDI r7, 14
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
