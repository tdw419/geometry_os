; DESCRIPTION: Composite: Creates a white rectangular region at (375, 106) spanning 82 by 12 pixels then Renders a red disk with center (88, 221) and radius 35.
; PLAN: r0=375(x), r1=106(y), r2=82(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=221(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 106
LDI r2, 82
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 221
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
