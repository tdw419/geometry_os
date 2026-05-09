; DESCRIPTION: Composite: Sets a single purple pixel at (363, 244) then Renders a cyan line between points (327, 234) and (325, 156) then Draws a red circle centered at (157, 136) with radius 73.
; PLAN: r0=363(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=234(y1), r7=325(x2), r8=156(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=136(y), r12=73(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 234
LDI r7, 325
LDI r8, 156
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 136
LDI r12, 73
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
