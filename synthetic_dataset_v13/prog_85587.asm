; DESCRIPTION: Composite: Draws a magenta rectangle at (258, 51) with width 75 and height 117 then Sets a single white pixel at (323, 171).
; PLAN: r0=258(x), r1=51(y), r2=75(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=171(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 51
LDI r2, 75
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 171
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
