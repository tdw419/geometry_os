; DESCRIPTION: Composite: Creates a white rectangular region at (27, 43) spanning 112 by 120 pixels then Places a white circle of radius 66 at center (290, 129).
; PLAN: r0=27(x), r1=43(y), r2=112(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=129(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 43
LDI r2, 112
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 129
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
