; DESCRIPTION: Composite: Sets a single yellow pixel at (347, 81) then Creates a white rectangular region at (183, 98) spanning 102 by 106 pixels then Renders a green line between points (6, 50) and (230, 253).
; PLAN: r0=347(x), r1=81(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=98(y), r7=102(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=6(x1), r11=50(y1), r12=230(x2), r13=253(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 81
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 98
LDI r7, 102
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 50
LDI r12, 230
LDI r13, 253
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
