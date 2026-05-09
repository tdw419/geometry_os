; DESCRIPTION: Composite: Renders a orange disk with center (76, 188) and radius 49 then Renders a magenta box of size 51x116 starting at (139, 101).
; PLAN: r0=76(x), r1=188(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=101(y), r7=51(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 188
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 101
LDI r7, 51
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
