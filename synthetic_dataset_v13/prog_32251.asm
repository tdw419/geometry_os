; DESCRIPTION: Composite: Draws a green rectangle at (334, 145) with width 86 and height 41 then Places a cyan dot at position (106, 157) then Draws a white circle centered at (265, 93) with radius 51.
; PLAN: r0=334(x), r1=145(y), r2=86(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=93(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 145
LDI r2, 86
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 93
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
