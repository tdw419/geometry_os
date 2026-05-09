; DESCRIPTION: Composite: Places a orange 20x114 rectangle at position (172, 18) then Sets a single orange pixel at (222, 92).
; PLAN: r0=172(x), r1=18(y), r2=20(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=92(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 18
LDI r2, 20
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 92
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
