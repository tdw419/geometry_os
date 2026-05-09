; DESCRIPTION: Composite: Creates a blue rectangular region at (255, 48) spanning 86 by 117 pixels then Renders a magenta disk with center (43, 83) and radius 41.
; PLAN: r0=255(x), r1=48(y), r2=86(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=83(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 48
LDI r2, 86
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 83
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
