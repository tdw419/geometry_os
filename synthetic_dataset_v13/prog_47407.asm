; DESCRIPTION: Composite: Places a black 93x55 rectangle at position (253, 46) then Places a black dot at position (308, 195).
; PLAN: r0=253(x), r1=46(y), r2=93(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=195(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 46
LDI r2, 93
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 195
LDI r7, 0x000000
PSET r5, r6, r7
HALT
