; DESCRIPTION: Composite: Draws a cyan rectangle at (5, 38) with width 107 and height 76 then Places a white dot at position (330, 3).
; PLAN: r0=5(x), r1=38(y), r2=107(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=3(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 38
LDI r2, 107
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 3
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
