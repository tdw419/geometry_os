; DESCRIPTION: Composite: Creates a purple rectangular region at (310, 141) spanning 112 by 41 pixels then Places a white circle of radius 22 at center (75, 191).
; PLAN: r0=310(x), r1=141(y), r2=112(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=191(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 141
LDI r2, 112
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 191
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
