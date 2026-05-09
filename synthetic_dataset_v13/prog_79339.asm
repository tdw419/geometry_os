; DESCRIPTION: Composite: Sets a single white pixel at (447, 236) then Places a blue 35x118 rectangle at position (415, 119).
; PLAN: r0=447(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=119(y), r7=35(width), r8=118(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 119
LDI r7, 35
LDI r8, 118
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
