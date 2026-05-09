; DESCRIPTION: Composite: Renders a white box of size 37x81 starting at (458, 104) then Places a magenta dot at position (177, 230).
; PLAN: r0=458(x), r1=104(y), r2=37(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=230(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 104
LDI r2, 37
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 230
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
