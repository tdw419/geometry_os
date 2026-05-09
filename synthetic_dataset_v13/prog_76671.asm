; DESCRIPTION: Composite: Sets a single white pixel at (147, 63) then Draws a blue rectangle at (94, 115) with width 104 and height 17.
; PLAN: r0=147(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=115(y), r7=104(width), r8=17(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 115
LDI r7, 104
LDI r8, 17
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
