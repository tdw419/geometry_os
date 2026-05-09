; DESCRIPTION: Composite: Creates a green rectangular region at (362, 131) spanning 53 by 90 pixels then Places a purple dot at position (247, 32).
; PLAN: r0=362(x), r1=131(y), r2=53(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 131
LDI r2, 53
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
