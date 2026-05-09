; DESCRIPTION: Composite: Creates a black rectangular region at (160, 125) spanning 10 by 116 pixels then Renders a green disk with center (320, 104) and radius 28.
; PLAN: r0=160(x), r1=125(y), r2=10(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=104(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 160
LDI r1, 125
LDI r2, 10
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 104
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
