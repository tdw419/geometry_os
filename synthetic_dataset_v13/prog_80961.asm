; DESCRIPTION: Composite: Renders a magenta box of size 90x17 starting at (289, 53) then Draws a green circle centered at (330, 73) with radius 53.
; PLAN: r0=289(x), r1=53(y), r2=90(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=73(y), r7=53(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 53
LDI r2, 90
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 73
LDI r7, 53
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
