; DESCRIPTION: Composite: Places a yellow 109x40 rectangle at position (102, 108) then Sets a single black pixel at (83, 121).
; PLAN: r0=102(x), r1=108(y), r2=109(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=121(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 108
LDI r2, 109
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 121
LDI r7, 0x000000
PSET r5, r6, r7
HALT
