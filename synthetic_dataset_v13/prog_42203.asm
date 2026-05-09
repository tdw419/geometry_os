; DESCRIPTION: Composite: Creates a white circular shape at (116, 115) with radius 61 then Places a yellow 57x119 rectangle at position (69, 34).
; PLAN: r0=116(x), r1=115(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=34(y), r7=57(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 115
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 34
LDI r7, 57
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
