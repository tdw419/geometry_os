; DESCRIPTION: Composite: Renders a green line between points (274, 182) and (496, 228) then Creates a green circular shape at (70, 48) with radius 41.
; PLAN: r0=274(x1), r1=182(y1), r2=496(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=48(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 182
LDI r2, 496
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 48
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
