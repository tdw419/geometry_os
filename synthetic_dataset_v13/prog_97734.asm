; DESCRIPTION: Composite: Sets a single purple pixel at (276, 130) then Draws a green circle centered at (406, 176) with radius 54.
; PLAN: r0=276(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=176(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 176
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
