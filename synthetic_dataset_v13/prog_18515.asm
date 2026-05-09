; DESCRIPTION: Composite: Sets a single cyan pixel at (44, 77) then Draws a blue rectangle at (478, 117) with width 32 and height 79.
; PLAN: r0=44(x), r1=77(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=117(y), r7=32(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 77
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 117
LDI r7, 32
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
