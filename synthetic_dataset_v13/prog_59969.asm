; DESCRIPTION: Composite: Places a white dot at position (34, 26) then Draws a yellow rectangle at (96, 37) with width 75 and height 119.
; PLAN: r0=34(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=37(y), r7=75(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 37
LDI r7, 75
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
