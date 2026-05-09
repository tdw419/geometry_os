; DESCRIPTION: Composite: Creates a green circular shape at (326, 83) with radius 15 then Creates a red rectangular region at (271, 118) spanning 39 by 67 pixels.
; PLAN: r0=326(x), r1=83(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=118(y), r7=39(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 83
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 118
LDI r7, 39
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
