; DESCRIPTION: Composite: Places a purple 53x52 rectangle at position (65, 3) then Sets a single cyan pixel at (418, 106).
; PLAN: r0=65(x), r1=3(y), r2=53(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=106(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 3
LDI r2, 53
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 106
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
