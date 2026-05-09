; DESCRIPTION: Composite: Sets a single green pixel at (430, 115) then Draws a magenta circle centered at (344, 99) with radius 40.
; PLAN: r0=430(x), r1=115(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=99(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 115
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 344
LDI r6, 99
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
