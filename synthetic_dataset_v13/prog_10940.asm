; DESCRIPTION: Composite: Places a white circle of radius 14 at center (207, 68) then Creates a yellow rectangular region at (399, 171) spanning 100 by 79 pixels then Sets a single purple pixel at (503, 255).
; PLAN: r0=207(x), r1=68(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=171(y), r7=100(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=503(x), r11=255(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 68
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 171
LDI r7, 100
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 255
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
