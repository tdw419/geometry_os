; DESCRIPTION: Composite: Creates a purple circular shape at (103, 131) with radius 61 then Creates a white rectangular region at (45, 30) spanning 116 by 70 pixels.
; PLAN: r0=103(x), r1=131(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=30(y), r7=116(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 131
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 30
LDI r7, 116
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
