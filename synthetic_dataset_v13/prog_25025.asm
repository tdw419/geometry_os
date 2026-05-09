; DESCRIPTION: Composite: Renders a red box of size 85x95 starting at (212, 104) then Draws a white circle centered at (491, 143) with radius 21.
; PLAN: r0=212(x), r1=104(y), r2=85(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=143(y), r7=21(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 104
LDI r2, 85
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 143
LDI r7, 21
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
