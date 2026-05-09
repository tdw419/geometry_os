; DESCRIPTION: Composite: Places a yellow dot at position (204, 101) then Draws a white rectangle at (281, 101) with width 14 and height 85.
; PLAN: r0=204(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=101(y), r7=14(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 101
LDI r7, 14
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
