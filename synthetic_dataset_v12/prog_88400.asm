; DESCRIPTION: Composite: Sets a single red pixel at (420, 15) then Draws a yellow rectangle at (255, 56) with width 66 and height 94.
; PLAN: r0=420(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=56(y), r7=66(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 56
LDI r7, 66
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
