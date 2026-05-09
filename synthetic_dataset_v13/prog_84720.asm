; DESCRIPTION: Composite: Places a red dot at position (15, 181) then Draws a blue circle centered at (317, 203) with radius 39.
; PLAN: r0=15(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=203(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 203
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
