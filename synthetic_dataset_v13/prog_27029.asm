; DESCRIPTION: Composite: Places a blue circle of radius 43 at center (169, 163) then Places a blue 20x113 rectangle at position (338, 105).
; PLAN: r0=169(x), r1=163(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=105(y), r7=20(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 163
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 105
LDI r7, 20
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
