; DESCRIPTION: Composite: Sets a single green pixel at (107, 108) then Draws a blue rectangle at (383, 83) with width 68 and height 61.
; PLAN: r0=107(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=83(y), r7=68(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 383
LDI r6, 83
LDI r7, 68
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
