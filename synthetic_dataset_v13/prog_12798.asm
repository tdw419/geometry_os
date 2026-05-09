; DESCRIPTION: Composite: Renders a magenta box of size 27x81 starting at (165, 175) then Creates a magenta circular shape at (256, 195) with radius 49.
; PLAN: r0=165(x), r1=175(y), r2=27(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=195(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 175
LDI r2, 27
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 195
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
