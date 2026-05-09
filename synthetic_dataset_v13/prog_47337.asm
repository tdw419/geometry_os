; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 86) then Draws a magenta circle centered at (252, 67) with radius 17.
; PLAN: r0=203(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=67(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 67
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
