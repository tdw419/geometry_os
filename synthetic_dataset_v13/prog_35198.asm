; DESCRIPTION: Composite: Places a orange dot at position (209, 33) then Draws a white rectangle at (6, 16) with width 15 and height 56.
; PLAN: r0=209(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=6(x), r6=16(y), r7=15(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 6
LDI r6, 16
LDI r7, 15
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
