; DESCRIPTION: Composite: Draws a red rectangle at (108, 116) with width 38 and height 36 then Sets a single white pixel at (60, 204) then Renders a white disk with center (173, 96) and radius 62.
; PLAN: r0=108(x), r1=116(y), r2=38(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=204(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=96(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 116
LDI r2, 38
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 204
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 96
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
