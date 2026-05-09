; DESCRIPTION: Composite: Draws a white rectangle at (298, 94) with width 27 and height 84 then Places a yellow dot at position (155, 89).
; PLAN: r0=298(x), r1=94(y), r2=27(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=89(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 94
LDI r2, 27
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 89
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
