; DESCRIPTION: Composite: Draws a red circle centered at (126, 109) with radius 58 then Places a yellow dot at position (446, 149).
; PLAN: r0=126(x), r1=109(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=149(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 109
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 149
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
