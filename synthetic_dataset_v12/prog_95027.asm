; DESCRIPTION: Composite: Renders a green disk with center (162, 154) and radius 74 then Places a black dot at position (218, 217).
; PLAN: r0=162(x), r1=154(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=217(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 154
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 217
LDI r7, 0x000000
PSET r5, r6, r7
HALT
