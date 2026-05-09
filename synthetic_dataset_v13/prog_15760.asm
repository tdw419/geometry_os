; DESCRIPTION: Composite: Places a white dot at position (207, 13) then Draws a blue rectangle at (230, 81) with width 60 and height 108.
; PLAN: r0=207(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=81(y), r7=60(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 81
LDI r7, 60
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
