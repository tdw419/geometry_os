; DESCRIPTION: Composite: Sets a single yellow pixel at (285, 236) then Creates a red rectangular region at (98, 157) spanning 109 by 89 pixels then Places a blue circle of radius 70 at center (199, 96).
; PLAN: r0=285(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=157(y), r7=109(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=96(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 98
LDI r6, 157
LDI r7, 109
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 96
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
