; DESCRIPTION: Composite: Sets a single blue pixel at (84, 86) then Draws a blue rectangle at (66, 29) with width 68 and height 33.
; PLAN: r0=84(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=29(y), r7=68(width), r8=33(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 86
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 29
LDI r7, 68
LDI r8, 33
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
