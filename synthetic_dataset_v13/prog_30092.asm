; DESCRIPTION: Composite: Places a purple 12x78 rectangle at position (70, 53) then Creates a red circular shape at (35, 57) with radius 35.
; PLAN: r0=70(x), r1=53(y), r2=12(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=57(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 53
LDI r2, 12
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 57
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
