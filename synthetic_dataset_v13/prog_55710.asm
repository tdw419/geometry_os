; DESCRIPTION: Composite: Creates a white rectangular region at (41, 223) spanning 63 by 14 pixels then Places a cyan dot at position (358, 155).
; PLAN: r0=41(x), r1=223(y), r2=63(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 223
LDI r2, 63
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
