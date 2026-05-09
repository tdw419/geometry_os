; DESCRIPTION: Composite: Places a black 33x27 rectangle at position (274, 89) then Sets a single red pixel at (353, 222).
; PLAN: r0=274(x), r1=89(y), r2=33(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=222(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 89
LDI r2, 33
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 222
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
