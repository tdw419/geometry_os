; DESCRIPTION: Composite: Places a purple 73x58 rectangle at position (356, 23) then Sets a single black pixel at (199, 210).
; PLAN: r0=356(x), r1=23(y), r2=73(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=210(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 23
LDI r2, 73
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 210
LDI r7, 0x000000
PSET r5, r6, r7
HALT
