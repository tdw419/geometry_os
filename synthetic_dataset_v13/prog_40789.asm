; DESCRIPTION: Composite: Draws a green rectangle at (413, 105) with width 51 and height 37 then Renders a cyan disk with center (164, 112) and radius 62.
; PLAN: r0=413(x), r1=105(y), r2=51(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=112(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 105
LDI r2, 51
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 112
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
