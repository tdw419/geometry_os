; DESCRIPTION: Composite: Renders a white box of size 90x19 starting at (166, 76) then Sets a single purple pixel at (408, 254).
; PLAN: r0=166(x), r1=76(y), r2=90(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=254(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 76
LDI r2, 90
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 254
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
