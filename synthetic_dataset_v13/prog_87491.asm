; DESCRIPTION: Composite: Draws a purple circle centered at (359, 196) with radius 38 then Places a magenta 95x12 rectangle at position (10, 73) then Places a red dot at position (397, 119).
; PLAN: r0=359(x), r1=196(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=73(y), r7=95(width), r8=12(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x), r11=119(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 196
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 73
LDI r7, 95
LDI r8, 12
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 119
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
