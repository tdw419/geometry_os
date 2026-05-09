; DESCRIPTION: Composite: Places a yellow 83x49 rectangle at position (121, 149) then Sets a single yellow pixel at (226, 12).
; PLAN: r0=121(x), r1=149(y), r2=83(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 149
LDI r2, 83
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
