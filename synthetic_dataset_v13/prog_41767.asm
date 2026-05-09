; DESCRIPTION: Composite: Sets a single purple pixel at (96, 142) then Places a blue 37x94 rectangle at position (131, 4).
; PLAN: r0=96(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=4(y), r7=37(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 4
LDI r7, 37
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
