; DESCRIPTION: Composite: Draws a purple rectangle at (32, 2) with width 63 and height 68 then Sets a single purple pixel at (184, 161).
; PLAN: r0=32(x), r1=2(y), r2=63(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=161(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 2
LDI r2, 63
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 161
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
