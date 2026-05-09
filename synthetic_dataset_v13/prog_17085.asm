; DESCRIPTION: Composite: Places a yellow dot at position (338, 11) then Draws a blue circle centered at (54, 69) with radius 40.
; PLAN: r0=338(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=69(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 54
LDI r6, 69
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
