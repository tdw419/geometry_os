; DESCRIPTION: Composite: Creates a yellow circular shape at (356, 47) with radius 22 then Places a cyan dot at position (151, 65).
; PLAN: r0=356(x), r1=47(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=65(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 47
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 65
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
