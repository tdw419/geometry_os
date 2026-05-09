; DESCRIPTION: Composite: Renders a green disk with center (340, 93) and radius 14 then Draws a white rectangle at (235, 58) with width 78 and height 119.
; PLAN: r0=340(x), r1=93(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=58(y), r7=78(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 93
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 58
LDI r7, 78
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
