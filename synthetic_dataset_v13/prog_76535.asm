; DESCRIPTION: Composite: Places a yellow dot at position (44, 212) then Draws a white rectangle at (415, 119) with width 89 and height 97.
; PLAN: r0=44(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=119(y), r7=89(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 212
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 119
LDI r7, 89
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
