; DESCRIPTION: Composite: Renders a cyan disk with center (296, 178) and radius 40 then Draws a red rectangle at (258, 66) with width 43 and height 50.
; PLAN: r0=296(x), r1=178(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=66(y), r7=43(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 178
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 66
LDI r7, 43
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
