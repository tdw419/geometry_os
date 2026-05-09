; DESCRIPTION: Composite: Renders a black disk with center (160, 126) and radius 45 then Draws a black rectangle at (306, 107) with width 10 and height 48.
; PLAN: r0=160(x), r1=126(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=107(y), r7=10(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 126
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 107
LDI r7, 10
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
