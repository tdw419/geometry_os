; DESCRIPTION: Composite: Renders a yellow box of size 14x82 starting at (318, 137) then Places a white line segment connecting (157, 51) to (478, 221).
; PLAN: r0=318(x), r1=137(y), r2=14(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=51(y1), r7=478(x2), r8=221(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 137
LDI r2, 14
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 51
LDI r7, 478
LDI r8, 221
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
