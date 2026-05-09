; DESCRIPTION: Composite: Places a cyan circle of radius 21 at center (290, 62) then Places a yellow dot at position (157, 116).
; PLAN: r0=290(x), r1=62(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 62
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
