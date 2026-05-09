; DESCRIPTION: Composite: Places a purple 31x90 rectangle at position (408, 17) then Draws a yellow circle centered at (164, 70) with radius 58.
; PLAN: r0=408(x), r1=17(y), r2=31(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=70(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 17
LDI r2, 31
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 70
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
