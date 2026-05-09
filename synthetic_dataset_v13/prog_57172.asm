; DESCRIPTION: Composite: Places a blue 115x38 rectangle at position (250, 63) then Places a orange dot at position (15, 145).
; PLAN: r0=250(x), r1=63(y), r2=115(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x), r6=145(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 63
LDI r2, 115
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 145
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
