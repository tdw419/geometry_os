; DESCRIPTION: Composite: Places a black 96x91 rectangle at position (386, 53) then Places a black dot at position (361, 136).
; PLAN: r0=386(x), r1=53(y), r2=96(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=136(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 53
LDI r2, 96
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 136
LDI r7, 0x000000
PSET r5, r6, r7
HALT
