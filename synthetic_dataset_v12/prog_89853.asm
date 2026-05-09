; DESCRIPTION: Composite: Renders a red box of size 103x107 starting at (357, 107) then Draws a orange circle centered at (201, 165) with radius 73.
; PLAN: r0=357(x), r1=107(y), r2=103(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=165(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 107
LDI r2, 103
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 165
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
