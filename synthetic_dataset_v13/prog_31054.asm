; DESCRIPTION: Composite: Renders a white line between points (494, 175) and (82, 47) then Creates a white circular shape at (378, 126) with radius 55.
; PLAN: r0=494(x1), r1=175(y1), r2=82(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=126(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 175
LDI r2, 82
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 126
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
