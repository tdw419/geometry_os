; DESCRIPTION: Composite: Renders a magenta box of size 112x88 starting at (127, 23) then Places a magenta circle of radius 12 at center (153, 220).
; PLAN: r0=127(x), r1=23(y), r2=112(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=220(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 23
LDI r2, 112
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 220
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
