; DESCRIPTION: Composite: Places a white dot at position (141, 251) then Places a blue 118x28 rectangle at position (148, 88).
; PLAN: r0=141(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=88(y), r7=118(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 88
LDI r7, 118
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
