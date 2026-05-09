; DESCRIPTION: Composite: Renders a magenta box of size 61x48 starting at (107, 126) then Places a blue dot at position (508, 23).
; PLAN: r0=107(x), r1=126(y), r2=61(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=23(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 126
LDI r2, 61
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 23
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
