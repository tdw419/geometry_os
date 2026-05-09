; DESCRIPTION: Composite: Draws a orange rectangle at (0, 133) with width 93 and height 63 then Sets a single white pixel at (75, 2).
; PLAN: r0=0(x), r1=133(y), r2=93(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=2(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 133
LDI r2, 93
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 2
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
