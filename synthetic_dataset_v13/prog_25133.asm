; DESCRIPTION: Composite: Draws a yellow rectangle at (371, 26) with width 105 and height 75 then Sets a single magenta pixel at (450, 239).
; PLAN: r0=371(x), r1=26(y), r2=105(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=239(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 26
LDI r2, 105
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 239
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
