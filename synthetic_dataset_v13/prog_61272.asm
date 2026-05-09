; DESCRIPTION: Composite: Places a purple 93x67 rectangle at position (275, 156) then Places a blue dot at position (322, 166).
; PLAN: r0=275(x), r1=156(y), r2=93(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 156
LDI r2, 93
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
