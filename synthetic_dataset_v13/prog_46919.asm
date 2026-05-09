; DESCRIPTION: Composite: Creates a red circular shape at (203, 57) with radius 38 then Creates a cyan rectangular region at (329, 53) spanning 52 by 103 pixels.
; PLAN: r0=203(x), r1=57(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=53(y), r7=52(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 57
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 53
LDI r7, 52
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
