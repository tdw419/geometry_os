; DESCRIPTION: Composite: Sets a single magenta pixel at (492, 94) then Draws a green rectangle at (236, 123) with width 57 and height 32.
; PLAN: r0=492(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=123(y), r7=57(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 123
LDI r7, 57
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
