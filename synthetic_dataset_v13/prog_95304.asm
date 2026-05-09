; DESCRIPTION: Composite: Creates a red rectangular region at (289, 14) spanning 30 by 35 pixels then Places a magenta circle of radius 41 at center (75, 61).
; PLAN: r0=289(x), r1=14(y), r2=30(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=61(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 14
LDI r2, 30
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 61
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
