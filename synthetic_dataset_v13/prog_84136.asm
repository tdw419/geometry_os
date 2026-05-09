; DESCRIPTION: Composite: Creates a green rectangular region at (250, 68) spanning 106 by 101 pixels then Places a red line segment connecting (283, 235) to (401, 133) then Sets a single white pixel at (114, 38).
; PLAN: r0=250(x), r1=68(y), r2=106(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=235(y1), r7=401(x2), r8=133(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 68
LDI r2, 106
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 235
LDI r7, 401
LDI r8, 133
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
