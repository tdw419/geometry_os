; DESCRIPTION: Composite: Creates a white rectangular region at (287, 169) spanning 32 by 62 pixels then Draws a cyan line from (222, 235) to (92, 77).
; PLAN: r0=287(x), r1=169(y), r2=32(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=235(y1), r7=92(x2), r8=77(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 169
LDI r2, 32
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 235
LDI r7, 92
LDI r8, 77
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
