; DESCRIPTION: Composite: Draws a white rectangle at (301, 107) with width 86 and height 61 then Places a purple circle of radius 30 at center (430, 107).
; PLAN: r0=301(x), r1=107(y), r2=86(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=107(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 107
LDI r2, 86
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 107
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
