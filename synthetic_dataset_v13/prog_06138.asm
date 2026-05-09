; DESCRIPTION: Composite: Creates a purple circular shape at (232, 143) with radius 80 then Sets a single purple pixel at (422, 84) then Draws a white rectangle at (5, 81) with width 81 and height 14.
; PLAN: r0=232(x), r1=143(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=5(x), r11=81(y), r12=81(width), r13=14(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 143
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 5
LDI r11, 81
LDI r12, 81
LDI r13, 14
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
