; DESCRIPTION: Composite: Sets a single blue pixel at (504, 52) then Draws a black rectangle at (334, 33) with width 86 and height 37.
; PLAN: r0=504(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=33(y), r7=86(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 33
LDI r7, 86
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
