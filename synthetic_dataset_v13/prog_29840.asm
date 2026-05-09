; DESCRIPTION: Composite: Draws a white rectangle at (130, 20) with width 51 and height 94 then Draws a yellow circle centered at (361, 103) with radius 56.
; PLAN: r0=130(x), r1=20(y), r2=51(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=103(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 20
LDI r2, 51
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 103
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
