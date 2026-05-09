; DESCRIPTION: Composite: Renders a red box of size 70x37 starting at (109, 195) then Creates a magenta circular shape at (225, 211) with radius 17.
; PLAN: r0=109(x), r1=195(y), r2=70(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=211(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 195
LDI r2, 70
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 211
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
