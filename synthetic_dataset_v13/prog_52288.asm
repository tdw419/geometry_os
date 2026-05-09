; DESCRIPTION: Composite: Creates a cyan circular shape at (95, 188) with radius 64 then Places a yellow dot at position (507, 178).
; PLAN: r0=95(x), r1=188(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 188
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
