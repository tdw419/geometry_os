; DESCRIPTION: Composite: Places a green circle of radius 79 at center (145, 171) then Draws a white rectangle at (172, 101) with width 81 and height 58.
; PLAN: r0=145(x), r1=171(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=101(y), r7=81(width), r8=58(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 171
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 101
LDI r7, 81
LDI r8, 58
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
