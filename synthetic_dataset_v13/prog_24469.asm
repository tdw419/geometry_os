; DESCRIPTION: Composite: Places a magenta 62x47 rectangle at position (402, 98) then Places a orange dot at position (430, 171).
; PLAN: r0=402(x), r1=98(y), r2=62(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=171(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 98
LDI r2, 62
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 171
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
