; DESCRIPTION: Composite: Sets a single magenta pixel at (53, 119) then Renders a white box of size 62x17 starting at (187, 232).
; PLAN: r0=53(x), r1=119(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=232(y), r7=62(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 119
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 232
LDI r7, 62
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
