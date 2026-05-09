; DESCRIPTION: Composite: Places a white circle of radius 72 at center (127, 98) then Draws a white rectangle at (156, 30) with width 89 and height 109.
; PLAN: r0=127(x), r1=98(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=30(y), r7=89(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 98
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 30
LDI r7, 89
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
