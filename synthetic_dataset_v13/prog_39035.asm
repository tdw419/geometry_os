; DESCRIPTION: Composite: Draws a green rectangle at (125, 5) with width 11 and height 97 then Places a red dot at position (182, 200).
; PLAN: r0=125(x), r1=5(y), r2=11(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 125
LDI r1, 5
LDI r2, 11
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
