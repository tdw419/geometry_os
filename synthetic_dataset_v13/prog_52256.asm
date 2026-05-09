; DESCRIPTION: Composite: Places a magenta 101x13 rectangle at position (294, 141) then Sets a single red pixel at (235, 172).
; PLAN: r0=294(x), r1=141(y), r2=101(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=172(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 141
LDI r2, 101
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 172
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
