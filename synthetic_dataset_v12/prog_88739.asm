; DESCRIPTION: Composite: Renders a cyan disk with center (90, 200) and radius 12 then Draws a green rectangle at (31, 88) with width 98 and height 117.
; PLAN: r0=90(x), r1=200(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=88(y), r7=98(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 200
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 88
LDI r7, 98
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
