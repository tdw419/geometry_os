; DESCRIPTION: Composite: Places a red dot at position (5, 4) then Places a black 84x17 rectangle at position (124, 145).
; PLAN: r0=5(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=145(y), r7=84(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 145
LDI r7, 84
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
