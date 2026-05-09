; DESCRIPTION: Composite: Sets a single white pixel at (240, 208) then Draws a cyan rectangle at (338, 83) with width 99 and height 97.
; PLAN: r0=240(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=83(y), r7=99(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 83
LDI r7, 99
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
