; DESCRIPTION: Composite: Draws a red rectangle at (462, 86) with width 21 and height 33 then Sets a single orange pixel at (65, 11).
; PLAN: r0=462(x), r1=86(y), r2=21(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=11(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 86
LDI r2, 21
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 11
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
