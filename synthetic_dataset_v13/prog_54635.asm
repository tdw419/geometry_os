; DESCRIPTION: Composite: Places a blue dot at position (499, 102) then Draws a blue circle centered at (132, 168) with radius 79.
; PLAN: r0=499(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=168(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 102
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 168
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
