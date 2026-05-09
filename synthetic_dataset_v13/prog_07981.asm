; DESCRIPTION: Composite: Places a cyan 59x13 rectangle at position (221, 35) then Sets a single cyan pixel at (23, 43).
; PLAN: r0=221(x), r1=35(y), r2=59(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=43(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 35
LDI r2, 59
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 43
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
