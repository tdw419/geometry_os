; DESCRIPTION: Composite: Sets a single white pixel at (350, 241) then Places a red 18x69 rectangle at position (4, 15).
; PLAN: r0=350(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=15(y), r7=18(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 15
LDI r7, 18
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
