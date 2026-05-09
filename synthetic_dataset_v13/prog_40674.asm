; DESCRIPTION: Composite: Renders a white disk with center (354, 150) and radius 21 then Draws a green rectangle at (168, 20) with width 36 and height 73.
; PLAN: r0=354(x), r1=150(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=20(y), r7=36(width), r8=73(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 150
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 20
LDI r7, 36
LDI r8, 73
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
