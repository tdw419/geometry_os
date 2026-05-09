; DESCRIPTION: Composite: Sets a single black pixel at (101, 16) then Places a magenta 49x53 rectangle at position (305, 45).
; PLAN: r0=101(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=45(y), r7=49(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 305
LDI r6, 45
LDI r7, 49
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
