; DESCRIPTION: Composite: Places a white 45x39 rectangle at position (1, 99) then Sets a single purple pixel at (79, 38).
; PLAN: r0=1(x), r1=99(y), r2=45(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=38(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 99
LDI r2, 45
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 38
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
