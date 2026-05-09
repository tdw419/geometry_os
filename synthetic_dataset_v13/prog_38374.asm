; DESCRIPTION: Composite: Places a blue dot at position (184, 156) then Places a purple 77x116 rectangle at position (316, 106).
; PLAN: r0=184(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=106(y), r7=77(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 106
LDI r7, 77
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
