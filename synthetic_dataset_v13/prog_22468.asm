; DESCRIPTION: Composite: Places a cyan dot at position (252, 85) then Draws a cyan circle centered at (217, 118) with radius 25.
; PLAN: r0=252(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=118(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 118
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
