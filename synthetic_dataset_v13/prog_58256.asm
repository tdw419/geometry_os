; DESCRIPTION: Composite: Sets a single magenta pixel at (199, 94) then Renders a cyan line between points (293, 73) and (264, 5) then Creates a white rectangular region at (119, 110) spanning 92 by 101 pixels.
; PLAN: r0=199(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=293(x1), r6=73(y1), r7=264(x2), r8=5(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=110(y), r12=92(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 73
LDI r7, 264
LDI r8, 5
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 110
LDI r12, 92
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
