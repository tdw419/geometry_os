; DESCRIPTION: Composite: Places a red 118x56 rectangle at position (84, 171) then Places a orange dot at position (252, 181).
; PLAN: r0=84(x), r1=171(y), r2=118(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=181(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 171
LDI r2, 118
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 181
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
