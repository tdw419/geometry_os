; DESCRIPTION: Composite: Places a white 30x16 rectangle at position (219, 170) then Sets a single yellow pixel at (380, 163).
; PLAN: r0=219(x), r1=170(y), r2=30(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=163(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 219
LDI r1, 170
LDI r2, 30
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 163
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
