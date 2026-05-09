; DESCRIPTION: Composite: Places a white dot at position (142, 109) then Renders a purple box of size 89x21 starting at (222, 179) then Renders a black disk with center (419, 47) and radius 31.
; PLAN: r0=142(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=179(y), r7=89(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=47(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 179
LDI r7, 89
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 47
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
