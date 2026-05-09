; DESCRIPTION: Composite: Draws a white rectangle at (279, 40) with width 109 and height 119 then Sets a single white pixel at (417, 238).
; PLAN: r0=279(x), r1=40(y), r2=109(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=238(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 40
LDI r2, 109
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 238
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
