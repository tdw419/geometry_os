; DESCRIPTION: Composite: Draws a yellow circle centered at (414, 178) with radius 69 then Sets a single white pixel at (443, 127).
; PLAN: r0=414(x), r1=178(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=127(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 178
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 127
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
