; DESCRIPTION: Composite: Draws a cyan rectangle at (278, 127) with width 70 and height 104 then Sets a single blue pixel at (105, 233).
; PLAN: r0=278(x), r1=127(y), r2=70(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=233(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 127
LDI r2, 70
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 233
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
