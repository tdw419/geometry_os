; DESCRIPTION: Composite: Renders a green disk with center (308, 138) and radius 50 then Draws a cyan rectangle at (120, 56) with width 114 and height 17.
; PLAN: r0=308(x), r1=138(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=56(y), r7=114(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 138
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 56
LDI r7, 114
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
