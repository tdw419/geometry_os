; DESCRIPTION: Composite: Creates a green rectangular region at (0, 60) spanning 107 by 27 pixels then Places a black dot at position (56, 44).
; PLAN: r0=0(x), r1=60(y), r2=107(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 60
LDI r2, 107
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
HALT
