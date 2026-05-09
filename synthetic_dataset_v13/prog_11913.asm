; DESCRIPTION: Composite: Places a black 24x25 rectangle at position (215, 111) then Places a black dot at position (56, 101).
; PLAN: r0=215(x), r1=111(y), r2=24(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=101(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 111
LDI r2, 24
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 101
LDI r7, 0x000000
PSET r5, r6, r7
HALT
