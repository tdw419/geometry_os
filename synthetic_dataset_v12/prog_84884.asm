; DESCRIPTION: Composite: Draws a white rectangle at (95, 134) with width 67 and height 110 then Sets a single yellow pixel at (196, 171).
; PLAN: r0=95(x), r1=134(y), r2=67(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 134
LDI r2, 67
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
