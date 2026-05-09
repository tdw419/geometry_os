; DESCRIPTION: Composite: Renders a yellow box of size 43x92 starting at (276, 98) then Renders a yellow disk with center (253, 184) and radius 67.
; PLAN: r0=276(x), r1=98(y), r2=43(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=184(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 98
LDI r2, 43
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 184
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
