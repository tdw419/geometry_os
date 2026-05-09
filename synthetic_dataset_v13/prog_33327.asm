; DESCRIPTION: Composite: Renders a magenta box of size 18x88 starting at (368, 22) then Creates a yellow circular shape at (56, 149) with radius 48.
; PLAN: r0=368(x), r1=22(y), r2=18(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=149(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 22
LDI r2, 18
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 149
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
