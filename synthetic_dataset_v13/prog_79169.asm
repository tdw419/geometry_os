; DESCRIPTION: Composite: Places a red 11x37 rectangle at position (486, 9) then Sets a single green pixel at (303, 22).
; PLAN: r0=486(x), r1=9(y), r2=11(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=22(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 486
LDI r1, 9
LDI r2, 11
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 22
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
