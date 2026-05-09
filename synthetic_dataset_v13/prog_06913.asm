; DESCRIPTION: Composite: Renders a purple disk with center (117, 151) and radius 31 then Places a green dot at position (92, 249).
; PLAN: r0=117(x), r1=151(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 151
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
