; DESCRIPTION: Composite: Draws a black circle centered at (317, 128) with radius 13 then Creates a purple rectangular region at (132, 73) spanning 96 by 113 pixels.
; PLAN: r0=317(x), r1=128(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=73(y), r7=96(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 128
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 73
LDI r7, 96
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
