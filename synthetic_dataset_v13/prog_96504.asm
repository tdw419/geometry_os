; DESCRIPTION: Composite: Places a red 119x39 rectangle at position (322, 163) then Sets a single blue pixel at (246, 62).
; PLAN: r0=322(x), r1=163(y), r2=119(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=62(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 163
LDI r2, 119
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 62
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
