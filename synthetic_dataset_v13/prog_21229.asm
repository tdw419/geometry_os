; DESCRIPTION: Composite: Creates a cyan rectangular region at (72, 36) spanning 48 by 34 pixels then Places a cyan dot at position (375, 2).
; PLAN: r0=72(x), r1=36(y), r2=48(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 36
LDI r2, 48
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
