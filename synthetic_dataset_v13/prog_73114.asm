; DESCRIPTION: Composite: Places a blue 11x45 rectangle at position (468, 41) then Places a magenta dot at position (250, 75).
; PLAN: r0=468(x), r1=41(y), r2=11(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=75(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 41
LDI r2, 11
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 75
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
