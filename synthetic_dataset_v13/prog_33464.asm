; DESCRIPTION: Composite: Draws a blue rectangle at (428, 132) with width 61 and height 84 then Creates a red circular shape at (457, 128) with radius 55.
; PLAN: r0=428(x), r1=132(y), r2=61(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=128(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 132
LDI r2, 61
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 128
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
