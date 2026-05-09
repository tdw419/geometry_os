; DESCRIPTION: Composite: Draws a blue circle centered at (405, 86) with radius 47 then Sets a single white pixel at (74, 208).
; PLAN: r0=405(x), r1=86(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 86
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
