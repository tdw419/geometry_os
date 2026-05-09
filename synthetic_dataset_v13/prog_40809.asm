; DESCRIPTION: Composite: Draws a black rectangle at (58, 127) with width 72 and height 10 then Places a black circle of radius 51 at center (338, 200).
; PLAN: r0=58(x), r1=127(y), r2=72(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=200(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 127
LDI r2, 72
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 200
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
