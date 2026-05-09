; DESCRIPTION: Composite: Creates a cyan circular shape at (178, 228) with radius 24 then Creates a white rectangular region at (81, 122) spanning 43 by 88 pixels.
; PLAN: r0=178(x), r1=228(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=122(y), r7=43(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 228
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 122
LDI r7, 43
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
