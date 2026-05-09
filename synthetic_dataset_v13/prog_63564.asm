; DESCRIPTION: Composite: Places a blue dot at position (499, 15) then Draws a cyan rectangle at (393, 75) with width 116 and height 18.
; PLAN: r0=499(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=75(y), r7=116(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 75
LDI r7, 116
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
