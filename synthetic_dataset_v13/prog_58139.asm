; DESCRIPTION: Composite: Sets a single white pixel at (449, 53) then Draws a white rectangle at (124, 57) with width 93 and height 99.
; PLAN: r0=449(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=57(y), r7=93(width), r8=99(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 57
LDI r7, 93
LDI r8, 99
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
