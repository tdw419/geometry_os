; DESCRIPTION: Composite: Renders a green disk with center (387, 174) and radius 10 then Places a black dot at position (2, 249).
; PLAN: r0=387(x), r1=174(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=249(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 174
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 249
LDI r7, 0x000000
PSET r5, r6, r7
HALT
