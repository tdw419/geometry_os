; DESCRIPTION: Composite: Draws a yellow rectangle at (303, 76) with width 24 and height 36 then Places a white dot at position (272, 236).
; PLAN: r0=303(x), r1=76(y), r2=24(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=236(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 76
LDI r2, 24
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 236
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
