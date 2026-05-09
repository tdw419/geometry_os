; DESCRIPTION: Composite: Places a purple 80x34 rectangle at position (357, 101) then Sets a single yellow pixel at (18, 104).
; PLAN: r0=357(x), r1=101(y), r2=80(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=104(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 101
LDI r2, 80
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 104
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
