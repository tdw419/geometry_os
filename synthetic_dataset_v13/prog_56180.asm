; DESCRIPTION: Composite: Places a yellow dot at position (252, 19) then Draws a white rectangle at (270, 56) with width 25 and height 100.
; PLAN: r0=252(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=56(y), r7=25(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 270
LDI r6, 56
LDI r7, 25
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
