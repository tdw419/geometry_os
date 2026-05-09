; DESCRIPTION: Composite: Sets a single red pixel at (349, 107) then Places a red line segment connecting (285, 94) to (57, 140) then Creates a white rectangular region at (204, 116) spanning 68 by 113 pixels.
; PLAN: r0=349(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=285(x1), r6=94(y1), r7=57(x2), r8=140(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=116(y), r12=68(width), r13=113(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 285
LDI r6, 94
LDI r7, 57
LDI r8, 140
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 116
LDI r12, 68
LDI r13, 113
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
