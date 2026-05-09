; DESCRIPTION: Composite: Draws a yellow rectangle at (445, 86) with width 15 and height 115 then Creates a yellow circular shape at (284, 162) with radius 80 then Places a purple dot at position (61, 121).
; PLAN: r0=445(x), r1=86(y), r2=15(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=162(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=121(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 86
LDI r2, 15
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 162
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 121
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
