; DESCRIPTION: Composite: Renders a black disk with center (223, 185) and radius 50 then Draws a green rectangle at (374, 71) with width 112 and height 114.
; PLAN: r0=223(x), r1=185(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=71(y), r7=112(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 185
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 71
LDI r7, 112
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
