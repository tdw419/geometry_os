; DESCRIPTION: Composite: Sets a single blue pixel at (222, 28) then Draws a white rectangle at (164, 37) with width 33 and height 108.
; PLAN: r0=222(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=37(y), r7=33(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 37
LDI r7, 33
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
