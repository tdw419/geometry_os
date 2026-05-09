; DESCRIPTION: Composite: Creates a yellow rectangular region at (317, 60) spanning 55 by 119 pixels then Sets a single black pixel at (242, 121).
; PLAN: r0=317(x), r1=60(y), r2=55(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=121(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 60
LDI r2, 55
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 121
LDI r7, 0x000000
PSET r5, r6, r7
HALT
