; DESCRIPTION: Composite: Renders a cyan line between points (246, 188) and (405, 203) then Sets a single yellow pixel at (447, 244) then Places a white circle of radius 61 at center (414, 102).
; PLAN: r0=246(x1), r1=188(y1), r2=405(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=102(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 188
LDI r2, 405
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 414
LDI r11, 102
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
