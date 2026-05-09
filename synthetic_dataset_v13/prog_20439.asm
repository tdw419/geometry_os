; DESCRIPTION: Composite: Creates a blue rectangular region at (87, 120) spanning 48 by 119 pixels then Places a yellow dot at position (384, 201).
; PLAN: r0=87(x), r1=120(y), r2=48(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=201(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 120
LDI r2, 48
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 201
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
