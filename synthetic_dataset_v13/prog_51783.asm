; DESCRIPTION: Composite: Places a black 53x85 rectangle at position (414, 19) then Places a green dot at position (327, 248).
; PLAN: r0=414(x), r1=19(y), r2=53(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=248(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 19
LDI r2, 53
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 248
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
