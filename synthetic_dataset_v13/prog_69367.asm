; DESCRIPTION: Composite: Sets a single magenta pixel at (144, 49) then Draws a cyan rectangle at (320, 78) with width 44 and height 120.
; PLAN: r0=144(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=78(y), r7=44(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 78
LDI r7, 44
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
