; DESCRIPTION: Composite: Places a purple 96x35 rectangle at position (142, 80) then Draws a white circle centered at (253, 56) with radius 23 then Places a orange dot at position (352, 200).
; PLAN: r0=142(x), r1=80(y), r2=96(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=56(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=200(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 80
LDI r2, 96
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 56
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 200
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
