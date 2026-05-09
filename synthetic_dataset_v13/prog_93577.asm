; DESCRIPTION: Composite: Renders a white box of size 66x10 starting at (82, 167) then Places a purple dot at position (235, 19) then Renders a cyan disk with center (496, 195) and radius 13.
; PLAN: r0=82(x), r1=167(y), r2=66(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=19(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=496(x), r11=195(y), r12=13(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 167
LDI r2, 66
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 19
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 496
LDI r11, 195
LDI r12, 13
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
