; DESCRIPTION: Composite: Places a blue dot at position (334, 66) then Places a cyan line segment connecting (184, 246) to (151, 102) then Draws a yellow circle centered at (251, 16) with radius 14.
; PLAN: r0=334(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=246(y1), r7=151(x2), r8=102(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=16(y), r12=14(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 246
LDI r7, 151
LDI r8, 102
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 16
LDI r12, 14
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
