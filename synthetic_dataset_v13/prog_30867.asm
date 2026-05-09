; DESCRIPTION: Composite: Places a cyan 77x33 rectangle at position (148, 70) then Places a cyan dot at position (317, 15).
; PLAN: r0=148(x), r1=70(y), r2=77(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=15(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 70
LDI r2, 77
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 15
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
