; DESCRIPTION: Composite: Renders a white box of size 72x78 starting at (316, 107) then Creates a purple circular shape at (120, 50) with radius 37.
; PLAN: r0=316(x), r1=107(y), r2=72(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=50(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 107
LDI r2, 72
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 50
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
