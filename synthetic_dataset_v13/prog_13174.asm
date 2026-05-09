; DESCRIPTION: Composite: Creates a black circular shape at (247, 36) with radius 26 then Renders a magenta box of size 113x113 starting at (199, 77).
; PLAN: r0=247(x), r1=36(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=77(y), r7=113(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 36
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 77
LDI r7, 113
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
