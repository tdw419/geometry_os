; DESCRIPTION: Composite: Sets a single green pixel at (5, 72) then Draws a purple rectangle at (89, 207) with width 87 and height 28.
; PLAN: r0=5(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=207(y), r7=87(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 207
LDI r7, 87
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
