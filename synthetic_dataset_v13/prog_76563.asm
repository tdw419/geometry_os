; DESCRIPTION: Composite: Renders a orange box of size 73x31 starting at (78, 102) then Renders a white disk with center (120, 92) and radius 58.
; PLAN: r0=78(x), r1=102(y), r2=73(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=92(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 102
LDI r2, 73
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 92
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
