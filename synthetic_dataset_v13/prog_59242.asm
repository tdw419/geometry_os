; DESCRIPTION: Composite: Draws a blue rectangle at (386, 79) with width 75 and height 58 then Sets a single red pixel at (190, 104).
; PLAN: r0=386(x), r1=79(y), r2=75(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 79
LDI r2, 75
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
