; DESCRIPTION: Composite: Sets a single cyan pixel at (420, 203) then Draws a blue circle centered at (465, 40) with radius 33.
; PLAN: r0=420(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=465(x), r6=40(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 465
LDI r6, 40
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
