; DESCRIPTION: Composite: Renders a red box of size 28x95 starting at (155, 17) then Renders a white disk with center (278, 193) and radius 11.
; PLAN: r0=155(x), r1=17(y), r2=28(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=193(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 155
LDI r1, 17
LDI r2, 28
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 193
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
