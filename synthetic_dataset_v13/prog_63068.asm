; DESCRIPTION: Composite: Places a white 118x30 rectangle at position (373, 3) then Sets a single white pixel at (116, 177).
; PLAN: r0=373(x), r1=3(y), r2=118(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=177(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 3
LDI r2, 118
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 177
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
