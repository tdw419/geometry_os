; DESCRIPTION: Composite: Places a black 66x65 rectangle at position (19, 100) then Sets a single yellow pixel at (435, 221).
; PLAN: r0=19(x), r1=100(y), r2=66(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=221(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 100
LDI r2, 66
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 221
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
