; DESCRIPTION: Composite: Places a blue 110x63 rectangle at position (259, 121) then Sets a single orange pixel at (268, 112).
; PLAN: r0=259(x), r1=121(y), r2=110(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=112(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 121
LDI r2, 110
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 112
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
