; DESCRIPTION: Composite: Places a blue dot at position (119, 142) then Draws a orange rectangle at (46, 88) with width 39 and height 11.
; PLAN: r0=119(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=88(y), r7=39(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 88
LDI r7, 39
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
