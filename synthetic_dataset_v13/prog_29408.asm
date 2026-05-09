; DESCRIPTION: Composite: Creates a white rectangular region at (112, 151) spanning 69 by 40 pixels then Places a red circle of radius 44 at center (197, 119).
; PLAN: r0=112(x), r1=151(y), r2=69(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=119(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 151
LDI r2, 69
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 119
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
