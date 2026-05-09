; DESCRIPTION: Composite: Places a red dot at position (154, 220) then Draws a blue circle centered at (155, 198) with radius 49.
; PLAN: r0=154(x), r1=220(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=198(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 154
LDI r1, 220
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 198
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
