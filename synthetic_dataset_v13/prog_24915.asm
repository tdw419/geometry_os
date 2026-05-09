; DESCRIPTION: Composite: Draws a black circle centered at (298, 145) with radius 56 then Draws a cyan rectangle at (268, 37) with width 118 and height 104.
; PLAN: r0=298(x), r1=145(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=37(y), r7=118(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 145
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 37
LDI r7, 118
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
