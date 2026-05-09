; DESCRIPTION: Composite: Places a blue 49x39 rectangle at position (119, 147) then Sets a single yellow pixel at (72, 164).
; PLAN: r0=119(x), r1=147(y), r2=49(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=164(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 147
LDI r2, 49
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 164
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
