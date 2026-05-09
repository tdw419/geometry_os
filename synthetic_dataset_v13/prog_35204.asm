; DESCRIPTION: Composite: Sets a single white pixel at (176, 29) then Places a red 43x69 rectangle at position (27, 108).
; PLAN: r0=176(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=108(y), r7=43(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 27
LDI r6, 108
LDI r7, 43
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
