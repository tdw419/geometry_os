; DESCRIPTION: Composite: Draws a orange rectangle at (44, 106) with width 69 and height 120 then Sets a single blue pixel at (195, 85).
; PLAN: r0=44(x), r1=106(y), r2=69(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=85(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 106
LDI r2, 69
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 85
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
