; DESCRIPTION: Composite: Creates a yellow rectangular region at (161, 26) spanning 98 by 44 pixels then Places a yellow dot at position (194, 133).
; PLAN: r0=161(x), r1=26(y), r2=98(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 26
LDI r2, 98
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
