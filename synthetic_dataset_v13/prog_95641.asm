; DESCRIPTION: Composite: Draws a green rectangle at (105, 164) with width 59 and height 27 then Sets a single black pixel at (115, 75).
; PLAN: r0=105(x), r1=164(y), r2=59(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=75(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 164
LDI r2, 59
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 75
LDI r7, 0x000000
PSET r5, r6, r7
HALT
