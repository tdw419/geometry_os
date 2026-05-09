; DESCRIPTION: Composite: Creates a black rectangular region at (460, 77) spanning 52 by 62 pixels then Renders a blue disk with center (44, 73) and radius 29.
; PLAN: r0=460(x), r1=77(y), r2=52(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=73(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 77
LDI r2, 52
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 73
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
