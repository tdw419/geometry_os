; DESCRIPTION: Composite: Sets a single green pixel at (167, 97) then Places a red 113x116 rectangle at position (395, 35).
; PLAN: r0=167(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=35(y), r7=113(width), r8=116(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 395
LDI r6, 35
LDI r7, 113
LDI r8, 116
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
