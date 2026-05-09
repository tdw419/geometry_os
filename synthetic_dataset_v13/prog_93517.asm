; DESCRIPTION: Composite: Draws a red rectangle at (208, 84) with width 11 and height 82 then Places a orange dot at position (171, 225).
; PLAN: r0=208(x), r1=84(y), r2=11(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=225(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 84
LDI r2, 11
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 225
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
