; DESCRIPTION: Composite: Places a cyan 37x107 rectangle at position (300, 60) then Sets a single yellow pixel at (383, 43).
; PLAN: r0=300(x), r1=60(y), r2=37(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=43(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 60
LDI r2, 37
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 43
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
