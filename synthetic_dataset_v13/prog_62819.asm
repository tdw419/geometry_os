; DESCRIPTION: Composite: Sets a single white pixel at (493, 170) then Draws a cyan circle centered at (23, 99) with radius 21.
; PLAN: r0=493(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=99(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 99
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
