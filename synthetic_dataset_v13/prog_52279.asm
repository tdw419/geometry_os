; DESCRIPTION: Composite: Creates a purple circular shape at (235, 154) with radius 67 then Places a red dot at position (178, 135).
; PLAN: r0=235(x), r1=154(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=135(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 154
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 135
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
