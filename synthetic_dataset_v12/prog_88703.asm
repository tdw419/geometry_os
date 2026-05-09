; DESCRIPTION: Composite: Creates a black circular shape at (223, 182) with radius 72 then Places a white line segment connecting (406, 236) to (494, 111).
; PLAN: r0=223(x), r1=182(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=236(y1), r7=494(x2), r8=111(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 182
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 236
LDI r7, 494
LDI r8, 111
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
