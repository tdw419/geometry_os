; DESCRIPTION: Composite: Sets a single orange pixel at (165, 140) then Places a blue 116x13 rectangle at position (192, 106).
; PLAN: r0=165(x), r1=140(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=106(y), r7=116(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 140
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 192
LDI r6, 106
LDI r7, 116
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
