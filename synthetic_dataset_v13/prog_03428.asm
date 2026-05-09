; DESCRIPTION: Composite: Creates a white rectangular region at (405, 100) spanning 74 by 23 pixels then Renders a cyan disk with center (238, 196) and radius 58.
; PLAN: r0=405(x), r1=100(y), r2=74(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=196(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 100
LDI r2, 74
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 196
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
