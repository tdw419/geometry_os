; DESCRIPTION: Composite: Places a white line segment connecting (509, 109) to (424, 154) then Places a yellow dot at position (257, 58).
; PLAN: r0=509(x1), r1=109(y1), r2=424(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=58(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 509
LDI r1, 109
LDI r2, 424
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 58
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
