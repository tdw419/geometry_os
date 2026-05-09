; DESCRIPTION: Composite: Places a purple 76x25 rectangle at position (420, 220) then Sets a single yellow pixel at (248, 1).
; PLAN: r0=420(x), r1=220(y), r2=76(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=1(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 220
LDI r2, 76
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 1
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
