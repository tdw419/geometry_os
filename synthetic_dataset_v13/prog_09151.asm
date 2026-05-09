; DESCRIPTION: Composite: Creates a yellow circular shape at (447, 189) with radius 34 then Places a red dot at position (161, 48).
; PLAN: r0=447(x), r1=189(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=48(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 189
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 48
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
