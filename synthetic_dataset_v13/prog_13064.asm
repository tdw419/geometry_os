; DESCRIPTION: Composite: Sets a single purple pixel at (396, 143) then Places a magenta 47x119 rectangle at position (150, 134).
; PLAN: r0=396(x), r1=143(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=134(y), r7=47(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 143
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 134
LDI r7, 47
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
