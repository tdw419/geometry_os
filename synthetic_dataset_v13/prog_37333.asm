; DESCRIPTION: Composite: Places a purple dot at position (486, 219) then Places a cyan 59x106 rectangle at position (15, 11).
; PLAN: r0=486(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=11(y), r7=59(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 11
LDI r7, 59
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
