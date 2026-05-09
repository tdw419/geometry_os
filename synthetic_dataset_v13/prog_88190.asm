; DESCRIPTION: Composite: Renders a blue disk with center (72, 45) and radius 31 then Draws a blue rectangle at (382, 173) with width 19 and height 72.
; PLAN: r0=72(x), r1=45(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=173(y), r7=19(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 45
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 173
LDI r7, 19
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
