; DESCRIPTION: Composite: Renders a blue disk with center (216, 64) and radius 53 then Draws a cyan rectangle at (375, 72) with width 53 and height 18.
; PLAN: r0=216(x), r1=64(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=72(y), r7=53(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 64
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 72
LDI r7, 53
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
