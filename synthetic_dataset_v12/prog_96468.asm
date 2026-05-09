; DESCRIPTION: Composite: Places a black 42x11 rectangle at position (230, 53) then Places a white dot at position (45, 151).
; PLAN: r0=230(x), r1=53(y), r2=42(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=151(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 53
LDI r2, 42
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 151
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
