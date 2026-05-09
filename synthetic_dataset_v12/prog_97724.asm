; DESCRIPTION: Composite: Places a blue 117x27 rectangle at position (315, 53) then Sets a single orange pixel at (205, 232).
; PLAN: r0=315(x), r1=53(y), r2=117(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 53
LDI r2, 117
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
