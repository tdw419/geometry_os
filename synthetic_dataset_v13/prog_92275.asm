; DESCRIPTION: Composite: Creates a magenta rectangular region at (355, 40) spanning 54 by 76 pixels then Places a blue dot at position (238, 9).
; PLAN: r0=355(x), r1=40(y), r2=54(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=9(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 40
LDI r2, 54
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 9
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
