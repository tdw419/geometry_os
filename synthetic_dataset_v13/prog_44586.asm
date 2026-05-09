; DESCRIPTION: Composite: Renders a red disk with center (468, 154) and radius 34 then Places a red dot at position (249, 24).
; PLAN: r0=468(x), r1=154(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=24(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 154
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 24
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
