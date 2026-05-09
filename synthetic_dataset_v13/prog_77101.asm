; DESCRIPTION: Composite: Draws a purple rectangle at (267, 23) with width 10 and height 43 then Places a yellow dot at position (264, 63).
; PLAN: r0=267(x), r1=23(y), r2=10(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=63(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 23
LDI r2, 10
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 63
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
