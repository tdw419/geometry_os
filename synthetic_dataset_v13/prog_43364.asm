; DESCRIPTION: Composite: Renders a black box of size 53x48 starting at (150, 109) then Creates a magenta circular shape at (174, 166) with radius 78.
; PLAN: r0=150(x), r1=109(y), r2=53(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=166(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 109
LDI r2, 53
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 166
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
