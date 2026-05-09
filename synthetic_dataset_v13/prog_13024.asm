; DESCRIPTION: Composite: Sets a single white pixel at (111, 170) then Places a purple 95x119 rectangle at position (331, 124).
; PLAN: r0=111(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=124(y), r7=95(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 124
LDI r7, 95
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
