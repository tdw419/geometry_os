; DESCRIPTION: Composite: Draws a white rectangle at (60, 18) with width 29 and height 100 then Places a black circle of radius 63 at center (160, 77).
; PLAN: r0=60(x), r1=18(y), r2=29(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=77(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 18
LDI r2, 29
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 77
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
