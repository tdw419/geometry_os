; DESCRIPTION: Composite: Renders a red disk with center (156, 23) and radius 23 then Draws a white rectangle at (379, 45) with width 67 and height 47.
; PLAN: r0=156(x), r1=23(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=45(y), r7=67(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 23
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 45
LDI r7, 67
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
