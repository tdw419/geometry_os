; DESCRIPTION: Composite: Renders a magenta box of size 111x41 starting at (401, 102) then Creates a white circular shape at (319, 151) with radius 78.
; PLAN: r0=401(x), r1=102(y), r2=111(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=151(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 102
LDI r2, 111
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 151
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
