; DESCRIPTION: Composite: Places a black 118x50 rectangle at position (174, 20) then Places a orange dot at position (347, 174).
; PLAN: r0=174(x), r1=20(y), r2=118(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=174(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 20
LDI r2, 118
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 174
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
