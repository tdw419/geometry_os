; DESCRIPTION: Composite: Places a purple 24x73 rectangle at position (53, 54) then Places a magenta dot at position (418, 62).
; PLAN: r0=53(x), r1=54(y), r2=24(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=62(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 54
LDI r2, 24
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 62
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
