; DESCRIPTION: Composite: Places a cyan 78x38 rectangle at position (385, 43) then Sets a single cyan pixel at (428, 139).
; PLAN: r0=385(x), r1=43(y), r2=78(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=139(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 43
LDI r2, 78
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 139
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
