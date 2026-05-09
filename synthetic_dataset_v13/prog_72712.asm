; DESCRIPTION: Composite: Renders a magenta box of size 39x17 starting at (222, 92) then Places a black circle of radius 23 at center (265, 84).
; PLAN: r0=222(x), r1=92(y), r2=39(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=84(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 92
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 84
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
