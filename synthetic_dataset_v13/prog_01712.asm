; DESCRIPTION: Composite: Sets a single red pixel at (294, 49) then Renders a red line between points (440, 163) and (116, 213) then Places a black circle of radius 57 at center (114, 184).
; PLAN: r0=294(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=163(y1), r7=116(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=184(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 294
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 440
LDI r6, 163
LDI r7, 116
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 184
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
