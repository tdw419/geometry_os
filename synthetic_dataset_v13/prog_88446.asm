; DESCRIPTION: Composite: Creates a white circular shape at (451, 74) with radius 56 then Creates a white rectangular region at (168, 66) spanning 16 by 37 pixels.
; PLAN: r0=451(x), r1=74(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=66(y), r7=16(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 74
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 66
LDI r7, 16
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
