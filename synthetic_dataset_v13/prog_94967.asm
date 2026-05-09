; DESCRIPTION: Composite: Renders a red disk with center (115, 101) and radius 73 then Places a cyan dot at position (187, 8).
; PLAN: r0=115(x), r1=101(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=8(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 101
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 8
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
