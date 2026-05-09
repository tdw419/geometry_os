; DESCRIPTION: Composite: Creates a magenta rectangular region at (406, 189) spanning 11 by 40 pixels then Places a black dot at position (448, 115).
; PLAN: r0=406(x), r1=189(y), r2=11(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 189
LDI r2, 11
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
HALT
