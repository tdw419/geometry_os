; DESCRIPTION: Composite: Sets a single white pixel at (339, 196) then Places a blue 38x89 rectangle at position (310, 21).
; PLAN: r0=339(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=21(y), r7=38(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 21
LDI r7, 38
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
