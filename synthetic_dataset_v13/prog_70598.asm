; DESCRIPTION: Composite: Creates a white rectangular region at (106, 183) spanning 111 by 54 pixels then Sets a single black pixel at (23, 57).
; PLAN: r0=106(x), r1=183(y), r2=111(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=57(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 183
LDI r2, 111
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 57
LDI r7, 0x000000
PSET r5, r6, r7
HALT
