; DESCRIPTION: Composite: Creates a yellow rectangular region at (34, 21) spanning 51 by 54 pixels then Places a yellow dot at position (492, 49).
; PLAN: r0=34(x), r1=21(y), r2=51(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=49(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 21
LDI r2, 51
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 49
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
