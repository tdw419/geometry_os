; DESCRIPTION: Composite: Places a cyan dot at position (291, 101) then Draws a blue rectangle at (11, 140) with width 108 and height 21.
; PLAN: r0=291(x), r1=101(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=140(y), r7=108(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 101
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 11
LDI r6, 140
LDI r7, 108
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
