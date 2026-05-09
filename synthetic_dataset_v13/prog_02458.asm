; DESCRIPTION: Composite: Draws a blue circle centered at (406, 131) with radius 47 then Places a red dot at position (186, 115).
; PLAN: r0=406(x), r1=131(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=115(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 131
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 115
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
