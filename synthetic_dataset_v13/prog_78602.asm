; DESCRIPTION: Composite: Sets a single purple pixel at (436, 89) then Draws a orange rectangle at (193, 78) with width 65 and height 114.
; PLAN: r0=436(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=78(y), r7=65(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 78
LDI r7, 65
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
