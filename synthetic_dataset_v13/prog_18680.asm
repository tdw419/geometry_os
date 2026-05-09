; DESCRIPTION: Composite: Places a magenta 114x58 rectangle at position (393, 126) then Places a black dot at position (39, 254).
; PLAN: r0=393(x), r1=126(y), r2=114(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=254(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 126
LDI r2, 114
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 254
LDI r7, 0x000000
PSET r5, r6, r7
HALT
