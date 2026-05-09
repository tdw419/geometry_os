; DESCRIPTION: Composite: Creates a green rectangular region at (430, 84) spanning 50 by 115 pixels then Places a yellow dot at position (494, 121).
; PLAN: r0=430(x), r1=84(y), r2=50(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=121(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 84
LDI r2, 50
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 121
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
