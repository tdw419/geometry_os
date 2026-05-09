; DESCRIPTION: Composite: Sets a single yellow pixel at (20, 122) then Creates a purple circular shape at (298, 198) with radius 46 then Draws a white rectangle at (348, 228) with width 10 and height 24.
; PLAN: r0=20(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=198(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x), r11=228(y), r12=10(width), r13=24(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 298
LDI r6, 198
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 228
LDI r12, 10
LDI r13, 24
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
