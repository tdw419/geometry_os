; DESCRIPTION: Composite: Sets a single red pixel at (415, 244) then Places a white line segment connecting (89, 92) to (138, 126) then Creates a magenta rectangular region at (61, 4) spanning 71 by 110 pixels.
; PLAN: r0=415(x), r1=244(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=89(x1), r6=92(y1), r7=138(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=4(y), r12=71(width), r13=110(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 244
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 89
LDI r6, 92
LDI r7, 138
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 4
LDI r12, 71
LDI r13, 110
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
