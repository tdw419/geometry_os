; DESCRIPTION: Composite: Places a black 33x13 rectangle at position (205, 127) then Sets a single blue pixel at (296, 235).
; PLAN: r0=205(x), r1=127(y), r2=33(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=235(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 127
LDI r2, 33
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 235
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
