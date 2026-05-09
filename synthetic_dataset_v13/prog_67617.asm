; DESCRIPTION: Composite: Places a purple 96x25 rectangle at position (186, 100) then Sets a single yellow pixel at (406, 94).
; PLAN: r0=186(x), r1=100(y), r2=96(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=94(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 100
LDI r2, 96
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 94
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
