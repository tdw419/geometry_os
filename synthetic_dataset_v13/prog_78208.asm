; DESCRIPTION: Composite: Draws a blue rectangle at (298, 30) with width 74 and height 102 then Sets a single cyan pixel at (258, 248).
; PLAN: r0=298(x), r1=30(y), r2=74(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=248(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 30
LDI r2, 74
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 248
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
