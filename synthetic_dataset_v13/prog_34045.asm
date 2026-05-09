; DESCRIPTION: Composite: Renders a magenta box of size 66x20 starting at (74, 25) then Creates a magenta circular shape at (79, 101) with radius 31.
; PLAN: r0=74(x), r1=25(y), r2=66(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=101(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 25
LDI r2, 66
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 101
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
