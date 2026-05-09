; DESCRIPTION: Composite: Draws a yellow circle centered at (300, 217) with radius 26 then Places a cyan dot at position (108, 165).
; PLAN: r0=300(x), r1=217(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=165(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 217
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 165
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
