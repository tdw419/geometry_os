; DESCRIPTION: Composite: Draws a white rectangle at (51, 237) with width 93 and height 10 then Draws a yellow circle centered at (77, 74) with radius 51.
; PLAN: r0=51(x), r1=237(y), r2=93(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=74(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 51
LDI r1, 237
LDI r2, 93
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 74
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
