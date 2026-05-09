; DESCRIPTION: Composite: Renders a magenta box of size 75x67 starting at (123, 166) then Creates a purple circular shape at (435, 64) with radius 28.
; PLAN: r0=123(x), r1=166(y), r2=75(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=64(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 166
LDI r2, 75
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 64
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
