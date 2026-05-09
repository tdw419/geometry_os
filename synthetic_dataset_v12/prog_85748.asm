; DESCRIPTION: Composite: Renders a black box of size 19x41 starting at (86, 61) then Renders a magenta disk with center (300, 98) and radius 17.
; PLAN: r0=86(x), r1=61(y), r2=19(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=98(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 61
LDI r2, 19
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 98
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
