; DESCRIPTION: Composite: Creates a blue rectangular region at (195, 111) spanning 13 by 101 pixels then Sets a single white pixel at (509, 142).
; PLAN: r0=195(x), r1=111(y), r2=13(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=142(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 111
LDI r2, 13
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 142
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
