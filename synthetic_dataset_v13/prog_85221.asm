; DESCRIPTION: Composite: Creates a red rectangular region at (301, 49) spanning 62 by 34 pixels then Places a yellow dot at position (1, 110).
; PLAN: r0=301(x), r1=49(y), r2=62(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 49
LDI r2, 62
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
